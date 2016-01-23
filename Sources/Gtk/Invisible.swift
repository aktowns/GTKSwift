import CGTK3
import CGTK3.CGObject
import CGTK3.CGlib2
import CGTK3.CAtk
import CGTK3.CGdk
import CGTK3.CGio

public class Invisible {
  

  public typealias RawHandle = UnsafeMutablePointer<GtkInvisible>
  public let handle: RawHandle

  public init(handle: RawHandle) {
    assert(handle != nil, "Invisible handed a nil handle")
    self.handle = handle

    let type = gtk_invisible_get_type()
    let inst = unsafeBitCast(handle, UnsafeMutablePointer<GTypeInstance>.self)
    assert(inst.memory.g_class != nil, "g_class for Invisible was nil")
    if inst.memory.g_class.memory.g_type != type {
      if g_type_check_instance_is_a(inst, type) == 0 {
        fatalError("g_class != Invisible type")
      }
    }
  }

        public convenience init( ) {
  
  let handle = gtk_invisible_new()

  self.init(handle: unsafeBitCast(handle, UnsafeMutablePointer<GtkInvisible>.self))
}
 public convenience init(newForScreen screen: GdkScreen) {
  
  let handle = gtk_invisible_new_for_screen(screen)

  self.init(handle: unsafeBitCast(handle, UnsafeMutablePointer<GtkInvisible>.self))
}

}
