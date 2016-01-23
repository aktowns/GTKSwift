import CGTK3
import CGTK3.CGObject
import CGTK3.CGlib2
import CGTK3.CAtk
import CGTK3.CGdk
import CGTK3.CGio

public class Cursor {
  

  public typealias RawHandle = GdkCursor
  public let handle: RawHandle

  public init(handle: RawHandle) {
    assert(handle != nil, "Cursor handed a nil handle")
    self.handle = handle

    let type = gdk_cursor_get_type()
    let inst = unsafeBitCast(handle, UnsafeMutablePointer<GTypeInstance>.self)
    assert(inst.memory.g_class != nil, "g_class for Cursor was nil")
    if inst.memory.g_class.memory.g_type != type {
      if g_type_check_instance_is_a(inst, type) == 0 {
        fatalError("g_class != Cursor type")
      }
    }
  }

        public convenience init( cursorType: GdkCursorType) {
  
  let handle = gdk_cursor_new(cursorType)

  self.init(handle: unsafeBitCast(handle, GdkCursor.self))
}
 public convenience init(newForDisplay display: GdkDisplay, cursorType: GdkCursorType) {
  
  let handle = gdk_cursor_new_for_display(display, cursorType)

  self.init(handle: unsafeBitCast(handle, GdkCursor.self))
}
 public convenience init(newFromName display: GdkDisplay, name: String) {
  
  let handle = gdk_cursor_new_from_name(display, name)

  self.init(handle: unsafeBitCast(handle, GdkCursor.self))
}
 public convenience init(newFromPixbuf display: GdkDisplay, pixbuf: GdkPixbuf, x: Int32, y: Int32) {
  
  let handle = gdk_cursor_new_from_pixbuf(display, pixbuf, x, y)

  self.init(handle: unsafeBitCast(handle, GdkCursor.self))
}
 public convenience init(newFromSurface display: GdkDisplay, surface: cairo_surface_t, x: Double, y: Double) {
  
  let handle = gdk_cursor_new_from_surface(display, surface, x, y)

  self.init(handle: unsafeBitCast(handle, GdkCursor.self))
}

}
