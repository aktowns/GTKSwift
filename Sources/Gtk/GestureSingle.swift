import CGTK3
import CGTK3.CGObject
import CGTK3.CGlib2
import CGTK3.CAtk
import CGTK3.CGdk
import CGTK3.CGio

public class GestureSingle {
  

  public typealias RawHandle = GtkGestureSingle
  public let handle: RawHandle

  public init(handle: RawHandle) {
    assert(handle != nil, "GestureSingle handed a nil handle")
    self.handle = handle

    let type = gtk_gesture_single_get_type()
    let inst = unsafeBitCast(handle, UnsafeMutablePointer<GTypeInstance>.self)
    assert(inst.memory.g_class != nil, "g_class for GestureSingle was nil")
    if inst.memory.g_class.memory.g_type != type {
      if g_type_check_instance_is_a(inst, type) == 0 {
        fatalError("g_class != GestureSingle type")
      }
    }
  }

  
}
