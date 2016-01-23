import CGTK3
import CGTK3.CGObject
import CGTK3.CGlib2
import CGTK3.CAtk
import CGTK3.CGdk
import CGTK3.CGio

public class AccelLabel {
  

  public typealias RawHandle = UnsafeMutablePointer<GtkAccelLabel>
  public let handle: RawHandle

  public init(handle: RawHandle) {
    assert(handle != nil, "AccelLabel handed a nil handle")
    self.handle = handle

    let type = gtk_accel_label_get_type()
    let inst = unsafeBitCast(handle, UnsafeMutablePointer<GTypeInstance>.self)
    assert(inst.memory.g_class != nil, "g_class for AccelLabel was nil")
    if inst.memory.g_class.memory.g_type != type {
      if g_type_check_instance_is_a(inst, type) == 0 {
        fatalError("g_class != AccelLabel type")
      }
    }
  }

        public convenience init( string: String) {
  
  let handle = gtk_accel_label_new(string)

  self.init(handle: unsafeBitCast(handle, UnsafeMutablePointer<GtkAccelLabel>.self))
}

}
