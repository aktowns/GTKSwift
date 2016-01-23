import CGTK3
import CGTK3.CGObject
import CGTK3.CGlib2
import CGTK3.CAtk
import CGTK3.CGdk
import CGTK3.CGio

public class MenuItem {
  

  public typealias RawHandle = GMenuItem
  public let handle: RawHandle

  public init(handle: RawHandle) {
    assert(handle != nil, "MenuItem handed a nil handle")
    self.handle = handle

    let type = g_menu_item_get_type()
    let inst = unsafeBitCast(handle, UnsafeMutablePointer<GTypeInstance>.self)
    assert(inst.memory.g_class != nil, "g_class for MenuItem was nil")
    if inst.memory.g_class.memory.g_type != type {
      if g_type_check_instance_is_a(inst, type) == 0 {
        fatalError("g_class != MenuItem type")
      }
    }
  }

        public convenience init( label: String, detailedAction: String) {
  
  let handle = g_menu_item_new(label, detailedAction)

  self.init(handle: unsafeBitCast(handle, GMenuItem.self))
}
 public convenience init(newFromModel model: UnsafeMutablePointer<GMenuModel>, itemIndex: Int32) {
  
  let handle = g_menu_item_new_from_model(model, itemIndex)

  self.init(handle: unsafeBitCast(handle, GMenuItem.self))
}
 public convenience init(newSection label: String, section: UnsafeMutablePointer<GMenuModel>) {
  
  let handle = g_menu_item_new_section(label, section)

  self.init(handle: unsafeBitCast(handle, GMenuItem.self))
}
 public convenience init(newSubmenu label: String, submenu: UnsafeMutablePointer<GMenuModel>) {
  
  let handle = g_menu_item_new_submenu(label, submenu)

  self.init(handle: unsafeBitCast(handle, GMenuItem.self))
}

}
