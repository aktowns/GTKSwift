import CGTK3
import CGTK3.CGObject
import CGTK3.CGlib2
import CGTK3.CAtk
import CGTK3.CGdk
import CGTK3.CGio

public class WindowGroup {
  

  public typealias RawHandle = UnsafeMutablePointer<GtkWindowGroup>
  public let handle: RawHandle

  public init(handle: RawHandle) {
    assert(handle != nil, "WindowGroup handed a nil handle")
    self.handle = handle

    let type = gtk_window_group_get_type()
    let inst = unsafeBitCast(handle, UnsafeMutablePointer<GTypeInstance>.self)
    assert(inst.memory.g_class != nil, "g_class for WindowGroup was nil")
    if inst.memory.g_class.memory.g_type != type {
      if g_type_check_instance_is_a(inst, type) == 0 {
        fatalError("g_class != WindowGroup type")
      }
    }
  }

        public convenience init( ) {
  
  let handle = gtk_window_group_new()

  self.init(handle: unsafeBitCast(handle, UnsafeMutablePointer<GtkWindowGroup>.self))
}

}
