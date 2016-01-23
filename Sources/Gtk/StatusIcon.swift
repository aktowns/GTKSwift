import CGTK3
import CGTK3.CGObject
import CGTK3.CGlib2
import CGTK3.CAtk
import CGTK3.CGdk
import CGTK3.CGio

public class StatusIcon {
  

  public typealias RawHandle = UnsafeMutablePointer<GtkStatusIcon>
  public let handle: RawHandle

  public init(handle: RawHandle) {
    assert(handle != nil, "StatusIcon handed a nil handle")
    self.handle = handle

    let type = gtk_status_icon_get_type()
    let inst = unsafeBitCast(handle, UnsafeMutablePointer<GTypeInstance>.self)
    assert(inst.memory.g_class != nil, "g_class for StatusIcon was nil")
    if inst.memory.g_class.memory.g_type != type {
      if g_type_check_instance_is_a(inst, type) == 0 {
        fatalError("g_class != StatusIcon type")
      }
    }
  }

        public convenience init( ) {
  
  let handle = gtk_status_icon_new()

  self.init(handle: unsafeBitCast(handle, UnsafeMutablePointer<GtkStatusIcon>.self))
}
 public convenience init(newFromFile filename: String) {
  
  let handle = gtk_status_icon_new_from_file(filename)

  self.init(handle: unsafeBitCast(handle, UnsafeMutablePointer<GtkStatusIcon>.self))
}
 public convenience init(newFromGicon icon: GIcon) {
  
  let handle = gtk_status_icon_new_from_gicon(icon)

  self.init(handle: unsafeBitCast(handle, UnsafeMutablePointer<GtkStatusIcon>.self))
}
 public convenience init(newFromIconName iconName: String) {
  
  let handle = gtk_status_icon_new_from_icon_name(iconName)

  self.init(handle: unsafeBitCast(handle, UnsafeMutablePointer<GtkStatusIcon>.self))
}
 public convenience init(newFromPixbuf pixbuf: GdkPixbuf) {
  
  let handle = gtk_status_icon_new_from_pixbuf(pixbuf)

  self.init(handle: unsafeBitCast(handle, UnsafeMutablePointer<GtkStatusIcon>.self))
}
 public convenience init(newFromStock stockId: String) {
  
  let handle = gtk_status_icon_new_from_stock(stockId)

  self.init(handle: unsafeBitCast(handle, UnsafeMutablePointer<GtkStatusIcon>.self))
}

}
