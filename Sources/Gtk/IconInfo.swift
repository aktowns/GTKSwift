import CGTK3
import CGTK3.CGObject
import CGTK3.CGlib2
import CGTK3.CAtk
import CGTK3.CGdk
import CGTK3.CGio

public class IconInfo {
  

  public typealias RawHandle = GtkIconInfo
  public let handle: RawHandle

  public init(handle: RawHandle) {
    assert(handle != nil, "IconInfo handed a nil handle")
    self.handle = handle

    let type = gtk_icon_info_get_type()
    let inst = unsafeBitCast(handle, UnsafeMutablePointer<GTypeInstance>.self)
    assert(inst.memory.g_class != nil, "g_class for IconInfo was nil")
    if inst.memory.g_class.memory.g_type != type {
      if g_type_check_instance_is_a(inst, type) == 0 {
        fatalError("g_class != IconInfo type")
      }
    }
  }

        public convenience init(newForPixbuf iconTheme: UnsafeMutablePointer<GtkIconTheme>, pixbuf: GdkPixbuf) {
  
  let handle = gtk_icon_info_new_for_pixbuf(iconTheme, pixbuf)

  self.init(handle: unsafeBitCast(handle, GtkIconInfo.self))
}

}
