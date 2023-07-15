#pragma once

#include "RHI.h"

class FFlutterUnrealCustomPresent : public FRHICustomPresent
{
public:
	FFlutterUnrealCustomPresent()
	{
	}

	// Inherited via FRHICustomPresent
	virtual void OnBackBufferResize() override { }
	virtual bool NeedsNativePresent() override
	{
		return true;
	}

	virtual bool Present(int32& InOutSyncInterval) override;
	virtual void PostPresent() override;

protected:
	void* mSwapchain = nullptr;
};
