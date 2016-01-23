import CGTK3
import CGTK3.CGObject
import CGTK3.CGlib2
import CGTK3.CAtk
import CGTK3.CGdk
import CGTK3.CGio

public class VButtonBox {
  

  public typealias RawHandle = UnsafeMutablePointer<GtkVButtonBox>
  public let handle: RawHandle

  public init(handle: RawHandle) {
    assert(handle != nil, "VButtonBox handed a nil handle")
    self.handle = handle

    let type = gtk_vbutton_box_get_type()
    let inst = unsafeBitCast(handle, UnsafeMutablePointer<GTypeInstance>.self)
    assert(inst.memory.g_class != nil, "g_class for VButtonBox was nil")
    if inst.memory.g_class.memory.g_type != type {
      if g_type_check_instance_is_a(inst, type) == 0 {
        fatalError("g_class != VButtonBox type")
      }
    }
  }

        public convenience init( ) {
  
  let handle = gtk_vbutton_box_new()

  self.init(handle: unsafeBitCast(handle, UnsafeMutablePointer<GtkVButtonBox>.self))
}

}
