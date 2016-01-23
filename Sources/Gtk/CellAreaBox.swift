import CGTK3
import CGTK3.CGObject
import CGTK3.CGlib2
import CGTK3.CAtk
import CGTK3.CGdk
import CGTK3.CGio

public class CellAreaBox {
  

  public typealias RawHandle = UnsafeMutablePointer<GtkCellAreaBox>
  public let handle: RawHandle

  public init(handle: RawHandle) {
    assert(handle != nil, "CellAreaBox handed a nil handle")
    self.handle = handle

    let type = gtk_cell_area_box_get_type()
    let inst = unsafeBitCast(handle, UnsafeMutablePointer<GTypeInstance>.self)
    assert(inst.memory.g_class != nil, "g_class for CellAreaBox was nil")
    if inst.memory.g_class.memory.g_type != type {
      if g_type_check_instance_is_a(inst, type) == 0 {
        fatalError("g_class != CellAreaBox type")
      }
    }
  }

        public convenience init( ) {
  
  let handle = gtk_cell_area_box_new()

  self.init(handle: unsafeBitCast(handle, UnsafeMutablePointer<GtkCellAreaBox>.self))
}

}
