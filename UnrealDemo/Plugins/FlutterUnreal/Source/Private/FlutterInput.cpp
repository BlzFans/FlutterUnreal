
#include "FlutterInput.h"
#include "FlutterEmbeder.h"
#include "Input/Events.h"
#include "HAL/IConsoleManager.h"
#include "Slate/SceneViewport.h"
#include "Widgets/SViewport.h"

#if PLATFORM_WINDOWS
#include "Windows/WindowsApplication.h"

class FWindowsMessageHandler : public IWindowsMessageHandler
{
	virtual bool ProcessMessage(HWND hwnd, uint32 msg, WPARAM wParam, LPARAM lParam, int32& OutResult) override
	{
		if (WM_CHAR == msg)
		{
			UGameViewportClient* GameViewport = GEngine->GameViewport;
			if (GameViewport && hwnd == GameViewport->GetWindow()->GetNativeWindow()->GetOSWindowHandle())
			{
				bool bConsume = flutterCharEvent(wParam);
				return bConsume;
			}
		}

		return false;
	}
};

FWindowsMessageHandler WindowsMessageHandler;
void AddWindowsMessageHandler()
{
	FWindowsApplication* WindowsApplication = (FWindowsApplication*)FSlateApplication::Get().GetPlatformApplication().Get();
	if (WindowsApplication)
	{
		WindowsApplication->AddMessageHandler(WindowsMessageHandler);
	}
}

void RemoveWindowsMessageHandler()
{
	if (FSlateApplication::IsInitialized())
	{
		FWindowsApplication* WindowsApplication = (FWindowsApplication*)FSlateApplication::Get().GetPlatformApplication().Get();
		if (WindowsApplication)
		{
			WindowsApplication->RemoveMessageHandler(WindowsMessageHandler);
		}
	}
}

#endif

FFluterInputProcessor::FFluterInputProcessor()
{
	/*
	IConsoleVariable* EnableSyntheticCursorMoves = IConsoleManager::Get().FindConsoleVariable(TEXT("Slate.EnableSyntheticCursorMoves"), false);
	if (EnableSyntheticCursorMoves && EnableSyntheticCursorMoves->GetBool())
	{
		EnableSyntheticCursorMoves->Set(false);
	}
	*/

#if PLATFORM_WINDOWS
	AddWindowsMessageHandler();
#endif
}

FFluterInputProcessor::~FFluterInputProcessor()
{
#if PLATFORM_WINDOWS
	RemoveWindowsMessageHandler();
#endif
}

void FFluterInputProcessor::Tick(const float DeltaTime, FSlateApplication& SlateApp, TSharedRef<ICursor> Cursor)
{
}

bool FFluterInputProcessor::HandleKeyDownEvent(FSlateApplication& SlateApp, const FKeyEvent& KeyEvent)
{
	bool bConsume = flutterKeyEvent(KeyEvent.GetKeyCode(), true, KeyEvent.IsRepeat());
	return bConsume;
}

bool FFluterInputProcessor::HandleKeyUpEvent(FSlateApplication& SlateApp, const FKeyEvent& KeyEvent)
{
	bool bConsume = flutterKeyEvent(KeyEvent.GetKeyCode(), false, false);
	return bConsume;
}

bool FFluterInputProcessor::HandleAnalogInputEvent(FSlateApplication& SlateApp, const FAnalogInputEvent& AnalogInputEvent)
{
	return false;
}

static bool getMousePos(const FPointerEvent& MouseEvent, FVector2D& LocalPosition)
{
	if (GEngine->GameViewport)
	{
		FSceneViewport* SceneViewport = GEngine->GameViewport->GetGameViewport();
		if (SceneViewport)
		{
			const FGeometry& CachedGeometry = SceneViewport->GetCachedGeometry();
			const FVector2D GeometrySize = CachedGeometry.GetLocalSize();
			if (GeometrySize.X == 0.f || GeometrySize.Y == 0.f)
			{
				return false;
			}

			FVector2D Position = MouseEvent.GetScreenSpacePosition();
			FVector2D Origin = CachedGeometry.GetAbsolutePosition();

#if WITH_EDITOR
			SWidget* RootWidget = SceneViewport->GetViewportWidget().Pin().Get();
			if (RootWidget)
			{
				while (RootWidget->GetParentWidget().IsValid())
				{
					RootWidget = RootWidget->GetParentWidget().Get();
				}

				Origin = RootWidget->GetTickSpaceGeometry().GetAbsolutePosition();
			}
#endif

			LocalPosition = Position - Origin;
			return true;
		}
	}

	return false;
}

bool FFluterInputProcessor::HandleMouseMoveEvent(FSlateApplication& SlateApp, const FPointerEvent& MouseEvent)
{
	FVector2D pos;
	if (getMousePos(MouseEvent, pos))
	{
		bool bConsume = flutterMouseMoveEvent((int)pos.X, (int)pos.Y);
		//UE_LOG(LogTemp, Log, TEXT("bConsume %s"), bConsume ? TEXT("True") : TEXT("False"));
		return bConsume;
	}

	return false;
}

bool FFluterInputProcessor::HandleMouseButtonDownEvent(FSlateApplication& SlateApp, const FPointerEvent& MouseEvent)
{
	FVector2D pos;
	if (getMousePos(MouseEvent, pos))
	{
		bool bConsume = flutterMouseButtonEvent((int)pos.X, (int)pos.Y, true);
		return bConsume;
	}

	return false;
}

bool FFluterInputProcessor::HandleMouseButtonUpEvent(FSlateApplication& SlateApp, const FPointerEvent& MouseEvent)
{
	FVector2D pos;
	if (getMousePos(MouseEvent, pos))
	{
		bool bConsume = flutterMouseButtonEvent((int)pos.X, (int)pos.Y, false);
		return bConsume;
	}

	return false;
}

bool FFluterInputProcessor::HandleMouseButtonDoubleClickEvent(FSlateApplication& SlateApp, const FPointerEvent& MouseEvent)
{
	return false;
}

bool FFluterInputProcessor::HandleMouseWheelOrGestureEvent(FSlateApplication& SlateApp, const FPointerEvent& WheelEvent, const FPointerEvent* GestureEvent)
{
	FVector2D pos;
	if (getMousePos(WheelEvent, pos))
	{
		bool bConsume = flutterMouseWheelEvent((int)pos.X, (int)pos.Y, 0, -WheelEvent.GetWheelDelta() * 10.0f);
		return bConsume;
	}

	return false;
}

bool FFluterInputProcessor::HandleMotionDetectedEvent(FSlateApplication& SlateApp, const FMotionEvent& MotionEvent)
{
	return false;
}

const TCHAR* FFluterInputProcessor::GetDebugName() const 
{ 
	return TEXT("FluterInput"); 
}
