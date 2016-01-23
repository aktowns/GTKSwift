import CGTK3
import CGTK3.CGObject
import CGTK3.CGlib2
import CGTK3.CAtk
import CGTK3.CGdk
import CGTK3.CGio

public class HBox {
  

  public typealias RawHandle = UnsafeMutablePointer<GtkHBox>
  public let handle: RawHandle

  public init(handle: RawHandle) {
    assert(handle != nil, "HBox handed a nil handle")
    self.handle = handle

    let type = gtk_hbox_get_type()
    let inst = unsafeBitCast(handle, UnsafeMutablePointer<GTypeInstance>.self)
    assert(inst.memory.g_class != nil, "g_class for HBox was nil")
    if inst.memory.g_class.memory.g_type != type {
      if g_type_check_instance_is_a(inst, type) == 0 {
        fatalError("g_class != HBox type")
      }
    }
  }

        public convenience init( homogeneous: Int32, spacing: Int32) {
  
  let handle = gtk_hbox_new(homogeneous, spacing)

  self.init(handle: unsafeBitCast(handle, UnsafeMutablePointer<GtkHBox>.self))
}

}
