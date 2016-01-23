import CGTK3
import CGTK3.CGObject
import CGTK3.CGlib2
import CGTK3.CAtk
import CGTK3.CGdk
import CGTK3.CGio

public class RadioButton {
  

  public typealias RawHandle = UnsafeMutablePointer<GtkRadioButton>
  public let handle: RawHandle

  public init(handle: RawHandle) {
    assert(handle != nil, "RadioButton handed a nil handle")
    self.handle = handle

    let type = gtk_radio_button_get_type()
    let inst = unsafeBitCast(handle, UnsafeMutablePointer<GTypeInstance>.self)
    assert(inst.memory.g_class != nil, "g_class for RadioButton was nil")
    if inst.memory.g_class.memory.g_type != type {
      if g_type_check_instance_is_a(inst, type) == 0 {
        fatalError("g_class != RadioButton type")
      }
    }
  }

        public convenience init( group: UnsafeMutablePointer<GSList>) {
  
  let handle = gtk_radio_button_new(group)

  self.init(handle: unsafeBitCast(handle, UnsafeMutablePointer<GtkRadioButton>.self))
}
 public convenience init(newFromWidget radioGroupMember: UnsafeMutablePointer<GtkRadioButton>) {
  
  let handle = gtk_radio_button_new_from_widget(radioGroupMember)

  self.init(handle: unsafeBitCast(handle, UnsafeMutablePointer<GtkRadioButton>.self))
}
 public convenience init(newWithLabel group: UnsafeMutablePointer<GSList>, label: String) {
  
  let handle = gtk_radio_button_new_with_label(group, label)

  self.init(handle: unsafeBitCast(handle, UnsafeMutablePointer<GtkRadioButton>.self))
}
 public convenience init(newWithLabelFromWidget radioGroupMember: UnsafeMutablePointer<GtkRadioButton>, label: String) {
  
  let handle = gtk_radio_button_new_with_label_from_widget(radioGroupMember, label)

  self.init(handle: unsafeBitCast(handle, UnsafeMutablePointer<GtkRadioButton>.self))
}
 public convenience init(newWithMnemonic group: UnsafeMutablePointer<GSList>, label: String) {
  
  let handle = gtk_radio_button_new_with_mnemonic(group, label)

  self.init(handle: unsafeBitCast(handle, UnsafeMutablePointer<GtkRadioButton>.self))
}
 public convenience init(newWithMnemonicFromWidget radioGroupMember: UnsafeMutablePointer<GtkRadioButton>, label: String) {
  
  let handle = gtk_radio_button_new_with_mnemonic_from_widget(radioGroupMember, label)

  self.init(handle: unsafeBitCast(handle, UnsafeMutablePointer<GtkRadioButton>.self))
}

}
