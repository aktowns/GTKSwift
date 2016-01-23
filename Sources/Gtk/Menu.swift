import CGTK3
import CGTK3.CGObject
import CGTK3.CGlib2
import CGTK3.CAtk
import CGTK3.CGdk
import CGTK3.CGio

public class Menu {
  

  public typealias RawHandle = UnsafeMutablePointer<GtkMenu>
  public let handle: RawHandle

  public init(handle: RawHandle) {
    assert(handle != nil, "Menu handed a nil handle")
    self.handle = handle

    let type = gtk_menu_get_type()
    let inst = unsafeBitCast(handle, UnsafeMutablePointer<GTypeInstance>.self)
    assert(inst.memory.g_class != nil, "g_class for Menu was nil")
    if inst.memory.g_class.memory.g_type != type {
      if g_type_check_instance_is_a(inst, type) == 0 {
        fatalError("g_class != Menu type")
      }
    }
  }

        public convenience init( ) {
  
  let handle = gtk_menu_new()

  self.init(handle: unsafeBitCast(handle, UnsafeMutablePointer<GtkMenu>.self))
}
 public convenience init(newFromModel model: UnsafeMutablePointer<GMenuModel>) {
  
  let handle = gtk_menu_new_from_model(model)

  self.init(handle: unsafeBitCast(handle, UnsafeMutablePointer<GtkMenu>.self))
}

}
