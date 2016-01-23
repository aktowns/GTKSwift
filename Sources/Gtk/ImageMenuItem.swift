import CGTK3
import CGTK3.CGObject
import CGTK3.CGlib2
import CGTK3.CAtk
import CGTK3.CGdk
import CGTK3.CGio

public class ImageMenuItem {
  

  public typealias RawHandle = UnsafeMutablePointer<GtkImageMenuItem>
  public let handle: RawHandle

  public init(handle: RawHandle) {
    assert(handle != nil, "ImageMenuItem handed a nil handle")
    self.handle = handle

    let type = gtk_image_menu_item_get_type()
    let inst = unsafeBitCast(handle, UnsafeMutablePointer<GTypeInstance>.self)
    assert(inst.memory.g_class != nil, "g_class for ImageMenuItem was nil")
    if inst.memory.g_class.memory.g_type != type {
      if g_type_check_instance_is_a(inst, type) == 0 {
        fatalError("g_class != ImageMenuItem type")
      }
    }
  }

        public convenience init( ) {
  
  let handle = gtk_image_menu_item_new()

  self.init(handle: unsafeBitCast(handle, UnsafeMutablePointer<GtkImageMenuItem>.self))
}
 public convenience init(newFromStock stockId: String, accelGroup: UnsafeMutablePointer<GtkAccelGroup>) {
  
  let handle = gtk_image_menu_item_new_from_stock(stockId, accelGroup)

  self.init(handle: unsafeBitCast(handle, UnsafeMutablePointer<GtkImageMenuItem>.self))
}
 public convenience init(newWithLabel label: String) {
  
  let handle = gtk_image_menu_item_new_with_label(label)

  self.init(handle: unsafeBitCast(handle, UnsafeMutablePointer<GtkImageMenuItem>.self))
}
 public convenience init(newWithMnemonic label: String) {
  
  let handle = gtk_image_menu_item_new_with_mnemonic(label)

  self.init(handle: unsafeBitCast(handle, UnsafeMutablePointer<GtkImageMenuItem>.self))
}

}
