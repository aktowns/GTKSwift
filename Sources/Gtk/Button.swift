import CGTK3
import CGTK3.CGObject
import CGTK3.CGlib2
import CGTK3.CAtk
import CGTK3.CGdk
import CGTK3.CGio

public class Button {
  

  public typealias RawHandle = UnsafeMutablePointer<GtkButton>
  public let handle: RawHandle

  public init(handle: RawHandle) {
    assert(handle != nil, "Button handed a nil handle")
    self.handle = handle

    let type = gtk_button_get_type()
    let inst = unsafeBitCast(handle, UnsafeMutablePointer<GTypeInstance>.self)
    assert(inst.memory.g_class != nil, "g_class for Button was nil")
    if inst.memory.g_class.memory.g_type != type {
      if g_type_check_instance_is_a(inst, type) == 0 {
        fatalError("g_class != Button type")
      }
    }
  }

        public convenience init( ) {
  
  let handle = gtk_button_new()

  self.init(handle: unsafeBitCast(handle, UnsafeMutablePointer<GtkButton>.self))
}
 public convenience init(newFromIconName iconName: String, size: GtkIconSize) {
  
  let handle = gtk_button_new_from_icon_name(iconName, size)

  self.init(handle: unsafeBitCast(handle, UnsafeMutablePointer<GtkButton>.self))
}
 public convenience init(newFromStock stockId: String) {
  
  let handle = gtk_button_new_from_stock(stockId)

  self.init(handle: unsafeBitCast(handle, UnsafeMutablePointer<GtkButton>.self))
}
 public convenience init(newWithLabel label: String) {
  
  let handle = gtk_button_new_with_label(label)

  self.init(handle: unsafeBitCast(handle, UnsafeMutablePointer<GtkButton>.self))
}
 public convenience init(newWithMnemonic label: String) {
  
  let handle = gtk_button_new_with_mnemonic(label)

  self.init(handle: unsafeBitCast(handle, UnsafeMutablePointer<GtkButton>.self))
}

}
