import CGTK3
import CGTK3.CGObject
import CGTK3.CGlib2
import CGTK3.CAtk
import CGTK3.CGdk
import CGTK3.CGio

public class ColorButton {
  

  public typealias RawHandle = UnsafeMutablePointer<GtkColorButton>
  public let handle: RawHandle

  public init(handle: RawHandle) {
    assert(handle != nil, "ColorButton handed a nil handle")
    self.handle = handle

    let type = gtk_color_button_get_type()
    let inst = unsafeBitCast(handle, UnsafeMutablePointer<GTypeInstance>.self)
    assert(inst.memory.g_class != nil, "g_class for ColorButton was nil")
    if inst.memory.g_class.memory.g_type != type {
      if g_type_check_instance_is_a(inst, type) == 0 {
        fatalError("g_class != ColorButton type")
      }
    }
  }

        public convenience init( ) {
  
  let handle = gtk_color_button_new()

  self.init(handle: unsafeBitCast(handle, UnsafeMutablePointer<GtkColorButton>.self))
}
 public convenience init(newWithColor color: UnsafeMutablePointer<GdkColor>) {
  
  let handle = gtk_color_button_new_with_color(color)

  self.init(handle: unsafeBitCast(handle, UnsafeMutablePointer<GtkColorButton>.self))
}
 public convenience init(newWithRgba rgba: UnsafeMutablePointer<GdkRGBA>) {
  
  let handle = gtk_color_button_new_with_rgba(rgba)

  self.init(handle: unsafeBitCast(handle, UnsafeMutablePointer<GtkColorButton>.self))
}

}
