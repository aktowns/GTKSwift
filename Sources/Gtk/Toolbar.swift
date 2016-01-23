import CGTK3
import CGTK3.CGObject
import CGTK3.CGlib2
import CGTK3.CAtk
import CGTK3.CGdk
import CGTK3.CGio

public class Toolbar {
  

  public typealias RawHandle = UnsafeMutablePointer<GtkToolbar>
  public let handle: RawHandle

  public init(handle: RawHandle) {
    assert(handle != nil, "Toolbar handed a nil handle")
    self.handle = handle

    let type = gtk_toolbar_get_type()
    let inst = unsafeBitCast(handle, UnsafeMutablePointer<GTypeInstance>.self)
    assert(inst.memory.g_class != nil, "g_class for Toolbar was nil")
    if inst.memory.g_class.memory.g_type != type {
      if g_type_check_instance_is_a(inst, type) == 0 {
        fatalError("g_class != Toolbar type")
      }
    }
  }

        public convenience init( ) {
  
  let handle = gtk_toolbar_new()

  self.init(handle: unsafeBitCast(handle, UnsafeMutablePointer<GtkToolbar>.self))
}

}
