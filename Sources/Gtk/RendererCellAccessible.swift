import CGTK3
import CGTK3.CGObject
import CGTK3.CGlib2
import CGTK3.CAtk
import CGTK3.CGdk
import CGTK3.CGio

public class RendererCellAccessible {
  

  public typealias RawHandle = UnsafeMutablePointer<GtkRendererCellAccessible>
  public let handle: RawHandle

  public init(handle: RawHandle) {
    assert(handle != nil, "RendererCellAccessible handed a nil handle")
    self.handle = handle

    let type = gtk_renderer_cell_accessible_get_type()
    let inst = unsafeBitCast(handle, UnsafeMutablePointer<GTypeInstance>.self)
    assert(inst.memory.g_class != nil, "g_class for RendererCellAccessible was nil")
    if inst.memory.g_class.memory.g_type != type {
      if g_type_check_instance_is_a(inst, type) == 0 {
        fatalError("g_class != RendererCellAccessible type")
      }
    }
  }

        public convenience init( renderer: UnsafeMutablePointer<GtkCellRenderer>) {
  
  let handle = gtk_renderer_cell_accessible_new(renderer)

  self.init(handle: unsafeBitCast(handle, UnsafeMutablePointer<GtkRendererCellAccessible>.self))
}

}
