import CGTK3
import CGTK3.CGObject
import CGTK3.CGlib2
import CGTK3.CAtk
import CGTK3.CGdk
import CGTK3.CGio

public class RadioMenuItem {
  

  public typealias RawHandle = UnsafeMutablePointer<GtkRadioMenuItem>
  public let handle: RawHandle

  public init(handle: RawHandle) {
    assert(handle != nil, "RadioMenuItem handed a nil handle")
    self.handle = handle

    let type = gtk_radio_menu_item_get_type()
    let inst = unsafeBitCast(handle, UnsafeMutablePointer<GTypeInstance>.self)
    assert(inst.memory.g_class != nil, "g_class for RadioMenuItem was nil")
    if inst.memory.g_class.memory.g_type != type {
      if g_type_check_instance_is_a(inst, type) == 0 {
        fatalError("g_class != RadioMenuItem type")
      }
    }
  }

        public convenience init( group: UnsafeMutablePointer<GSList>) {
  
  let handle = gtk_radio_menu_item_new(group)

  self.init(handle: unsafeBitCast(handle, UnsafeMutablePointer<GtkRadioMenuItem>.self))
}
 public convenience init(newFromWidget group: UnsafeMutablePointer<GtkRadioMenuItem>) {
  
  let handle = gtk_radio_menu_item_new_from_widget(group)

  self.init(handle: unsafeBitCast(handle, UnsafeMutablePointer<GtkRadioMenuItem>.self))
}
 public convenience init(newWithLabel group: UnsafeMutablePointer<GSList>, label: String) {
  
  let handle = gtk_radio_menu_item_new_with_label(group, label)

  self.init(handle: unsafeBitCast(handle, UnsafeMutablePointer<GtkRadioMenuItem>.self))
}
 public convenience init(newWithLabelFromWidget group: UnsafeMutablePointer<GtkRadioMenuItem>, label: String) {
  
  let handle = gtk_radio_menu_item_new_with_label_from_widget(group, label)

  self.init(handle: unsafeBitCast(handle, UnsafeMutablePointer<GtkRadioMenuItem>.self))
}
 public convenience init(newWithMnemonic group: UnsafeMutablePointer<GSList>, label: String) {
  
  let handle = gtk_radio_menu_item_new_with_mnemonic(group, label)

  self.init(handle: unsafeBitCast(handle, UnsafeMutablePointer<GtkRadioMenuItem>.self))
}
 public convenience init(newWithMnemonicFromWidget group: UnsafeMutablePointer<GtkRadioMenuItem>, label: String) {
  
  let handle = gtk_radio_menu_item_new_with_mnemonic_from_widget(group, label)

  self.init(handle: unsafeBitCast(handle, UnsafeMutablePointer<GtkRadioMenuItem>.self))
}

}
