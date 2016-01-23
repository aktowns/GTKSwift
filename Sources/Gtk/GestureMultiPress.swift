import CGTK3
import CGTK3.CGObject
import CGTK3.CGlib2
import CGTK3.CAtk
import CGTK3.CGdk
import CGTK3.CGio

public class GestureMultiPress {
  

  public typealias RawHandle = GtkGestureMultiPress
  public let handle: RawHandle

  public init(handle: RawHandle) {
    assert(handle != nil, "GestureMultiPress handed a nil handle")
    self.handle = handle

    let type = gtk_gesture_multi_press_get_type()
    let inst = unsafeBitCast(handle, UnsafeMutablePointer<GTypeInstance>.self)
    assert(inst.memory.g_class != nil, "g_class for GestureMultiPress was nil")
    if inst.memory.g_class.memory.g_type != type {
      if g_type_check_instance_is_a(inst, type) == 0 {
        fatalError("g_class != GestureMultiPress type")
      }
    }
  }

        public convenience init( widget: UnsafeMutablePointer<GtkWidget>) {
  
  let handle = gtk_gesture_multi_press_new(widget)

  self.init(handle: unsafeBitCast(handle, GtkGestureMultiPress.self))
}

}
