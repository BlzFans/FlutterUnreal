
#include "SFlutterWidget.h"
#include "FlutterEmbeder.h"
#include "Slate/SceneViewport.h"
#include <tuple>

void SFlutterWidget::Construct(const FArguments& InArgs)
{
	GameViewport = InArgs._GameViewport;
}

void SFlutterWidget::Tick(const FGeometry& AllottedGeometry, const double InCurrentTime, const float InDeltaTime)
{
}

bool SFlutterWidget::SupportsKeyboardFocus() const
{
	return true;
}

inline FReply ToReply(bool bConsume)
{
	return bConsume ? FReply::Handled() : FReply::Unhandled();
}

FReply SFlutterWidget::OnKeyChar(const FGeometry& MyGeometry, const FCharacterEvent& CharacterEvent)
{
	bool bConsume = flutterCharEvent(CharacterEvent.GetCharacter());
	return ToReply(bConsume);
}

FReply SFlutterWidget::OnKeyDown(const FGeometry& MyGeometry, const FKeyEvent& KeyEvent)
{
	//UE_LOG(LogTemp, Warning, TEXT("OnKeyDown"));
	bool bConsume = flutterKeyEvent(KeyEvent.GetKeyCode(), true, KeyEvent.IsRepeat());
	//flutterRawKeyEvent(KeyEvent.GetKeyCode(), KeyEvent.GetModifierKeys(), true, KeyEvent.IsRepeat());
	return ToReply(bConsume);
}

FReply SFlutterWidget::OnKeyUp(const FGeometry& MyGeometry, const FKeyEvent& KeyEvent)
{
	bool bConsume = flutterKeyEvent(KeyEvent.GetKeyCode(), false, false);
	//flutterRawKeyEvent(KeyEvent.GetKeyCode(), KeyEvent.GetModifierKeys(), false, false);
	return ToReply(bConsume);
}

FReply SFlutterWidget::OnAnalogValueChanged(const FGeometry& MyGeometry, const FAnalogInputEvent& AnalogInputEvent)
{
	return ToReply(false);
}

FVector2D getMousePos(SWidget* Widget, const FGeometry& MyGeometry, const FPointerEvent& MouseEvent)
{
	const FVector2D GeometrySize = MyGeometry.GetLocalSize();
	if (GeometrySize.X == 0.f || GeometrySize.Y == 0.f)
	{
		return { 0, 0 };
	}

	FVector2D Position = MouseEvent.GetScreenSpacePosition();
	FVector2D Origin = MyGeometry.GetAbsolutePosition();

#if WITH_EDITOR
	SWidget* RootWidget = Widget;
	while (RootWidget->GetParentWidget().IsValid())
	{
		RootWidget = RootWidget->GetParentWidget().Get();
	}

	Origin = RootWidget->GetTickSpaceGeometry().GetAbsolutePosition();
#endif

	Position = Position - Origin;
	return Position;
}

FReply SFlutterWidget::OnMouseButtonDown(const FGeometry& MyGeometry, const FPointerEvent& MouseEvent)
{
	FVector2D pos = getMousePos(this, MyGeometry, MouseEvent);
	//UE_LOG(LogTemp, Warning, TEXT("OnMouseButtonDown %d %d"), (int)pos.X, (int)pos.Y);

	bool bConsume = flutterMouseButtonEvent((int)pos.X, (int)pos.Y, true);
	return ToReply(bConsume);
}

FReply SFlutterWidget::OnMouseButtonDoubleClick(const FGeometry& MyGeometry, const FPointerEvent& MouseEvent)
{
	return ToReply(false);
}

FReply SFlutterWidget::OnMouseButtonUp(const FGeometry& MyGeometry, const FPointerEvent& MouseEvent)
{
	FVector2D pos = getMousePos(this, MyGeometry, MouseEvent);
	//UE_LOG(LogTemp, Warning, TEXT("OnMouseButtonUp %d %d"), (int)pos.X, (int)pos.Y);

	bool bConsume = flutterMouseButtonEvent((int)pos.X, (int)pos.Y, false);
	return ToReply(bConsume);
}

FReply SFlutterWidget::OnMouseWheel(const FGeometry& MyGeometry, const FPointerEvent& MouseEvent)
{
	FVector2D pos = getMousePos(this, MyGeometry, MouseEvent);
	bool bConsume = flutterMouseWheelEvent((int)pos.X, (int)pos.Y, 0, -MouseEvent.GetWheelDelta() * 10.0f);
	return ToReply(bConsume);
}

FReply SFlutterWidget::OnMouseMove(const FGeometry& MyGeometry, const FPointerEvent& MouseEvent)
{
	FVector2D pos = getMousePos(this, MyGeometry, MouseEvent);
	bool bConsume = flutterMouseMoveEvent((int)pos.X, (int)pos.Y);
	return ToReply(bConsume);
}

FReply SFlutterWidget::OnFocusReceived(const FGeometry& MyGeometry, const FFocusEvent& FocusEvent)
{
	return ToReply(false);
}

void SFlutterWidget::OnFocusLost(const FFocusEvent& FocusEvent)
{
}

void SFlutterWidget::OnMouseEnter(const FGeometry& MyGeometry, const FPointerEvent& MouseEvent)
{
}

void SFlutterWidget::OnMouseLeave(const FPointerEvent& MouseEvent)
{
}

FReply SFlutterWidget::OnTouchStarted(const FGeometry& MyGeometry, const FPointerEvent& TouchEvent)
{
	return ToReply(false);
}

FReply SFlutterWidget::OnTouchMoved(const FGeometry& MyGeometry, const FPointerEvent& TouchEvent)
{
	return ToReply(false);
}

FReply SFlutterWidget::OnTouchEnded(const FGeometry& MyGeometry, const FPointerEvent& TouchEvent)
{
	return ToReply(false);
}
