import CGTK3
import CGTK3.CGObject
import CGTK3.CGlib2
import CGTK3.CAtk
import CGTK3.CGdk
import CGTK3.CGio

public class ApplicationWindow {
  

  public typealias RawHandle = UnsafeMutablePointer<GtkApplicationWindow>
  public let handle: RawHandle

  public init(handle: RawHandle) {
    assert(handle != nil, "ApplicationWindow handed a nil handle")
    self.handle = handle

    let type = gtk_application_window_get_type()
    let inst = unsafeBitCast(handle, UnsafeMutablePointer<GTypeInstance>.self)
    assert(inst.memory.g_class != nil, "g_class for ApplicationWindow was nil")
    if inst.memory.g_class.memory.g_type != type {
      if g_type_check_instance_is_a(inst, type) == 0 {
        fatalError("g_class != ApplicationWindow type")
      }
    }
  }

        public convenience init( application: UnsafeMutablePointer<GtkApplication>) {
  
  let handle = gtk_application_window_new(application)

  self.init(handle: unsafeBitCast(handle, UnsafeMutablePointer<GtkApplicationWindow>.self))
}

}
