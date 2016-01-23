import CGTK3
import CGTK3.CGObject
import CGTK3.CGlib2
import CGTK3.CAtk
import CGTK3.CGdk
import CGTK3.CGio

public class Image {
  

  public typealias RawHandle = UnsafeMutablePointer<GtkImage>
  public let handle: RawHandle

  public init(handle: RawHandle) {
    assert(handle != nil, "Image handed a nil handle")
    self.handle = handle

    let type = gtk_image_get_type()
    let inst = unsafeBitCast(handle, UnsafeMutablePointer<GTypeInstance>.self)
    assert(inst.memory.g_class != nil, "g_class for Image was nil")
    if inst.memory.g_class.memory.g_type != type {
      if g_type_check_instance_is_a(inst, type) == 0 {
        fatalError("g_class != Image type")
      }
    }
  }

        public convenience init( ) {
  
  let handle = gtk_image_new()

  self.init(handle: unsafeBitCast(handle, UnsafeMutablePointer<GtkImage>.self))
}
 public convenience init(newFromAnimation animation: GdkPixbufAnimation) {
  
  let handle = gtk_image_new_from_animation(animation)

  self.init(handle: unsafeBitCast(handle, UnsafeMutablePointer<GtkImage>.self))
}
 public convenience init(newFromFile filename: String) {
  
  let handle = gtk_image_new_from_file(filename)

  self.init(handle: unsafeBitCast(handle, UnsafeMutablePointer<GtkImage>.self))
}
 public convenience init(newFromGicon icon: GIcon, size: GtkIconSize) {
  
  let handle = gtk_image_new_from_gicon(icon, size)

  self.init(handle: unsafeBitCast(handle, UnsafeMutablePointer<GtkImage>.self))
}
 public convenience init(newFromIconName iconName: String, size: GtkIconSize) {
  
  let handle = gtk_image_new_from_icon_name(iconName, size)

  self.init(handle: unsafeBitCast(handle, UnsafeMutablePointer<GtkImage>.self))
}
 public convenience init(newFromIconSet iconSet: GtkIconSet, size: GtkIconSize) {
  
  let handle = gtk_image_new_from_icon_set(iconSet, size)

  self.init(handle: unsafeBitCast(handle, UnsafeMutablePointer<GtkImage>.self))
}
 public convenience init(newFromPixbuf pixbuf: GdkPixbuf) {
  
  let handle = gtk_image_new_from_pixbuf(pixbuf)

  self.init(handle: unsafeBitCast(handle, UnsafeMutablePointer<GtkImage>.self))
}
 public convenience init(newFromResource resourcePath: String) {
  
  let handle = gtk_image_new_from_resource(resourcePath)

  self.init(handle: unsafeBitCast(handle, UnsafeMutablePointer<GtkImage>.self))
}
 public convenience init(newFromStock stockId: String, size: GtkIconSize) {
  
  let handle = gtk_image_new_from_stock(stockId, size)

  self.init(handle: unsafeBitCast(handle, UnsafeMutablePointer<GtkImage>.self))
}
 public convenience init(newFromSurface surface: cairo_surface_t) {
  
  let handle = gtk_image_new_from_surface(surface)

  self.init(handle: unsafeBitCast(handle, UnsafeMutablePointer<GtkImage>.self))
}

}
