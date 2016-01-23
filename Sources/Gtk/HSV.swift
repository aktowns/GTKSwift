import CGTK3
import CGTK3.CGObject
import CGTK3.CGlib2
import CGTK3.CAtk
import CGTK3.CGdk
import CGTK3.CGio

public class HSV {
  

  public typealias RawHandle = UnsafeMutablePointer<GtkHSV>
  public let handle: RawHandle

  public init(handle: RawHandle) {
    assert(handle != nil, "HSV handed a nil handle")
    self.handle = handle

    let type = gtk_hsv_get_type()
    let inst = unsafeBitCast(handle, UnsafeMutablePointer<GTypeInstance>.self)
    assert(inst.memory.g_class != nil, "g_class for HSV was nil")
    if inst.memory.g_class.memory.g_type != type {
      if g_type_check_instance_is_a(inst, type) == 0 {
        fatalError("g_class != HSV type")
      }
    }
  }

        public convenience init( ) {
  
  let handle = gtk_hsv_new()

  self.init(handle: unsafeBitCast(handle, UnsafeMutablePointer<GtkHSV>.self))
}

}
