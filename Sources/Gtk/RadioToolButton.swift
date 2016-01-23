import CGTK3
import CGTK3.CGObject
import CGTK3.CGlib2
import CGTK3.CAtk
import CGTK3.CGdk
import CGTK3.CGio

public class RadioToolButton {
  

  public typealias RawHandle = UnsafeMutablePointer<GtkRadioToolButton>
  public let handle: RawHandle

  public init(handle: RawHandle) {
    assert(handle != nil, "RadioToolButton handed a nil handle")
    self.handle = handle

    let type = gtk_radio_tool_button_get_type()
    let inst = unsafeBitCast(handle, UnsafeMutablePointer<GTypeInstance>.self)
    assert(inst.memory.g_class != nil, "g_class for RadioToolButton was nil")
    if inst.memory.g_class.memory.g_type != type {
      if g_type_check_instance_is_a(inst, type) == 0 {
        fatalError("g_class != RadioToolButton type")
      }
    }
  }

        public convenience init( group: UnsafeMutablePointer<GSList>) {
  
  let handle = gtk_radio_tool_button_new(group)

  self.init(handle: unsafeBitCast(handle, UnsafeMutablePointer<GtkRadioToolButton>.self))
}
 public convenience init(newFromStock group: UnsafeMutablePointer<GSList>, stockId: String) {
  
  let handle = gtk_radio_tool_button_new_from_stock(group, stockId)

  self.init(handle: unsafeBitCast(handle, UnsafeMutablePointer<GtkRadioToolButton>.self))
}
 public convenience init(newFromWidget group: UnsafeMutablePointer<GtkRadioToolButton>) {
  
  let handle = gtk_radio_tool_button_new_from_widget(group)

  self.init(handle: unsafeBitCast(handle, UnsafeMutablePointer<GtkRadioToolButton>.self))
}
 public convenience init(newWithStockFromWidget group: UnsafeMutablePointer<GtkRadioToolButton>, stockId: String) {
  
  let handle = gtk_radio_tool_button_new_with_stock_from_widget(group, stockId)

  self.init(handle: unsafeBitCast(handle, UnsafeMutablePointer<GtkRadioToolButton>.self))
}

}
