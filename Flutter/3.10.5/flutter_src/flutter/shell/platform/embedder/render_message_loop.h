
#ifndef RENDER_MESSAGE_LOOP_H
#define RENDER_MESSAGE_LOOP_H

#include "flutter/fml/memory/ref_counted.h"
#include "flutter/fml/memory/ref_ptr.h"
#include "flutter/fml/message_loop_impl.h"
#include "flutter/fml/task_runner.h"

namespace fml {

class RenderMessageLoop : public fml::MessageLoop {
 public:
  RenderMessageLoop();
};

class RenderTaskRunner : public fml::TaskRunner {
 public:
  explicit RenderTaskRunner(fml::RefPtr<fml::MessageLoopImpl> loop);
  virtual bool RunsTasksOnCurrentThread();
};

RenderTaskRunner::RenderTaskRunner(fml::RefPtr<fml::MessageLoopImpl> loop)
    : fml::TaskRunner(loop) {}

extern BoolCallback isInRenderThread;
bool RenderTaskRunner::RunsTasksOnCurrentThread() {
  return isInRenderThread(nullptr);
}

RenderMessageLoop::RenderMessageLoop() 
    :fml::MessageLoop() 
{
  task_runner_ = fml::MakeRefCounted<RenderTaskRunner>(loop_);
}

}  // namespace fml

#endif
