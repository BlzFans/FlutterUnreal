#pragma once

#include "CoreMinimal.h"
#include "GenericPlatform/ICursor.h"
#include "Framework/Application/IInputProcessor.h"

class FFluterInputProcessor : public IInputProcessor
{
public:
	FFluterInputProcessor();
	virtual ~FFluterInputProcessor();

	virtual void Tick(const float DeltaTime, FSlateApplication& SlateApp, TSharedRef<ICursor> Cursor) override;

	/** Key down input */
	virtual bool HandleKeyDownEvent(FSlateApplication& SlateApp, const FKeyEvent& KeyEvent) override;

	/** Key up input */
	virtual bool HandleKeyUpEvent(FSlateApplication& SlateApp, const FKeyEvent& KeyEvent) override;

	/** Analog axis input */
	virtual bool HandleAnalogInputEvent(FSlateApplication& SlateApp, const FAnalogInputEvent& AnalogInputEvent) override;

	/** Mouse movement input */
	virtual bool HandleMouseMoveEvent(FSlateApplication& SlateApp, const FPointerEvent& MouseEvent) override;

	/** Mouse button press */
	virtual bool HandleMouseButtonDownEvent(FSlateApplication& SlateApp, const FPointerEvent& MouseEvent) override;

	/** Mouse button release */
	virtual bool HandleMouseButtonUpEvent(FSlateApplication& SlateApp, const FPointerEvent& MouseEvent) override;

	/** Mouse button double clicked. */
	virtual bool HandleMouseButtonDoubleClickEvent(FSlateApplication& SlateApp, const FPointerEvent& MouseEvent) override;

	/** Mouse wheel input */
	virtual bool HandleMouseWheelOrGestureEvent(FSlateApplication& SlateApp, const FPointerEvent& InWheelEvent, const FPointerEvent* InGestureEvent) override;

	/** Called when a motion-driven device has new input */
	virtual bool HandleMotionDetectedEvent(FSlateApplication& SlateApp, const FMotionEvent& MotionEvent) override;

	/** Debug name for logging purposes */
	virtual const TCHAR* GetDebugName() const override;
};
