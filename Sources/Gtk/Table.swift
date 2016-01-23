import CGTK3
import CGTK3.CGObject
import CGTK3.CGlib2
import CGTK3.CAtk
import CGTK3.CGdk
import CGTK3.CGio

public class Table {
  

  public typealias RawHandle = UnsafeMutablePointer<GtkTable>
  public let handle: RawHandle

  public init(handle: RawHandle) {
    assert(handle != nil, "Table handed a nil handle")
    self.handle = handle

    let type = gtk_table_get_type()
    let inst = unsafeBitCast(handle, UnsafeMutablePointer<GTypeInstance>.self)
    assert(inst.memory.g_class != nil, "g_class for Table was nil")
    if inst.memory.g_class.memory.g_type != type {
      if g_type_check_instance_is_a(inst, type) == 0 {
        fatalError("g_class != Table type")
      }
    }
  }

        public convenience init( rows: UInt32, columns: UInt32, homogeneous: Int32) {
  
  let handle = gtk_table_new(rows, columns, homogeneous)

  self.init(handle: unsafeBitCast(handle, UnsafeMutablePointer<GtkTable>.self))
}

}
