import CGTK3
import CGTK3.CGObject
import CGTK3.CGlib2
import CGTK3.CAtk
import CGTK3.CGdk
import CGTK3.CGio

public class CellView {
  

  public typealias RawHandle = UnsafeMutablePointer<GtkCellView>
  public let handle: RawHandle

  public init(handle: RawHandle) {
    assert(handle != nil, "CellView handed a nil handle")
    self.handle = handle

    let type = gtk_cell_view_get_type()
    let inst = unsafeBitCast(handle, UnsafeMutablePointer<GTypeInstance>.self)
    assert(inst.memory.g_class != nil, "g_class for CellView was nil")
    if inst.memory.g_class.memory.g_type != type {
      if g_type_check_instance_is_a(inst, type) == 0 {
        fatalError("g_class != CellView type")
      }
    }
  }

        public convenience init( ) {
  
  let handle = gtk_cell_view_new()

  self.init(handle: unsafeBitCast(handle, UnsafeMutablePointer<GtkCellView>.self))
}
 public convenience init(newWithContext area: UnsafeMutablePointer<GtkCellArea>, context: UnsafeMutablePointer<GtkCellAreaContext>) {
  
  let handle = gtk_cell_view_new_with_context(area, context)

  self.init(handle: unsafeBitCast(handle, UnsafeMutablePointer<GtkCellView>.self))
}
 public convenience init(newWithMarkup markup: String) {
  
  let handle = gtk_cell_view_new_with_markup(markup)

  self.init(handle: unsafeBitCast(handle, UnsafeMutablePointer<GtkCellView>.self))
}
 public convenience init(newWithPixbuf pixbuf: GdkPixbuf) {
  
  let handle = gtk_cell_view_new_with_pixbuf(pixbuf)

  self.init(handle: unsafeBitCast(handle, UnsafeMutablePointer<GtkCellView>.self))
}
 public convenience init(newWithText text: String) {
  
  let handle = gtk_cell_view_new_with_text(text)

  self.init(handle: unsafeBitCast(handle, UnsafeMutablePointer<GtkCellView>.self))
}

}
