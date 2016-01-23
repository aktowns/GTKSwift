import CGTK3
import CGTK3.CGObject
import CGTK3.CGlib2
import CGTK3.CAtk
import CGTK3.CGdk
import CGTK3.CGio

public class AppLaunchContext {
  

  public typealias RawHandle = GdkAppLaunchContext
  public let handle: RawHandle

  public init(handle: RawHandle) {
    assert(handle != nil, "AppLaunchContext handed a nil handle")
    self.handle = handle

    let type = gdk_app_launch_context_get_type()
    let inst = unsafeBitCast(handle, UnsafeMutablePointer<GTypeInstance>.self)
    assert(inst.memory.g_class != nil, "g_class for AppLaunchContext was nil")
    if inst.memory.g_class.memory.g_type != type {
      if g_type_check_instance_is_a(inst, type) == 0 {
        fatalError("g_class != AppLaunchContext type")
      }
    }
  }

        public convenience init( ) {
  
  let handle = gdk_app_launch_context_new()

  self.init(handle: unsafeBitCast(handle, GdkAppLaunchContext.self))
}

}
