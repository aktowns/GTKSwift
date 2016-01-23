import CGTK3
import CGTK3.CGObject
import CGTK3.CGlib2
import CGTK3.CAtk
import CGTK3.CGdk
import CGTK3.CGio

public class SeparatorMenuItem {
  

  public typealias RawHandle = UnsafeMutablePointer<GtkSeparatorMenuItem>
  public let handle: RawHandle

  public init(handle: RawHandle) {
    assert(handle != nil, "SeparatorMenuItem handed a nil handle")
    self.handle = handle

    let type = gtk_separator_menu_item_get_type()
    let inst = unsafeBitCast(handle, UnsafeMutablePointer<GTypeInstance>.self)
    assert(inst.memory.g_class != nil, "g_class for SeparatorMenuItem was nil")
    if inst.memory.g_class.memory.g_type != type {
      if g_type_check_instance_is_a(inst, type) == 0 {
        fatalError("g_class != SeparatorMenuItem type")
      }
    }
  }

        public convenience init( ) {
  
  let handle = gtk_separator_menu_item_new()

  self.init(handle: unsafeBitCast(handle, UnsafeMutablePointer<GtkSeparatorMenuItem>.self))
}

}
