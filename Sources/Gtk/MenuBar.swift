import CGTK3
import CGTK3.CGObject
import CGTK3.CGlib2
import CGTK3.CAtk
import CGTK3.CGdk
import CGTK3.CGio

public class MenuBar {
  

  public typealias RawHandle = UnsafeMutablePointer<GtkMenuBar>
  public let handle: RawHandle

  public init(handle: RawHandle) {
    assert(handle != nil, "MenuBar handed a nil handle")
    self.handle = handle

    let type = gtk_menu_bar_get_type()
    let inst = unsafeBitCast(handle, UnsafeMutablePointer<GTypeInstance>.self)
    assert(inst.memory.g_class != nil, "g_class for MenuBar was nil")
    if inst.memory.g_class.memory.g_type != type {
      if g_type_check_instance_is_a(inst, type) == 0 {
        fatalError("g_class != MenuBar type")
      }
    }
  }

        public convenience init( ) {
  
  let handle = gtk_menu_bar_new()

  self.init(handle: unsafeBitCast(handle, UnsafeMutablePointer<GtkMenuBar>.self))
}
 public convenience init(newFromModel model: UnsafeMutablePointer<GMenuModel>) {
  
  let handle = gtk_menu_bar_new_from_model(model)

  self.init(handle: unsafeBitCast(handle, UnsafeMutablePointer<GtkMenuBar>.self))
}

}
