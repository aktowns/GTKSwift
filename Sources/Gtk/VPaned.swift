import CGTK3
import CGTK3.CGObject
import CGTK3.CGlib2
import CGTK3.CAtk
import CGTK3.CGdk
import CGTK3.CGio

public class VPaned {
  

  public typealias RawHandle = UnsafeMutablePointer<GtkVPaned>
  public let handle: RawHandle

  public init(handle: RawHandle) {
    assert(handle != nil, "VPaned handed a nil handle")
    self.handle = handle

    let type = gtk_vpaned_get_type()
    let inst = unsafeBitCast(handle, UnsafeMutablePointer<GTypeInstance>.self)
    assert(inst.memory.g_class != nil, "g_class for VPaned was nil")
    if inst.memory.g_class.memory.g_type != type {
      if g_type_check_instance_is_a(inst, type) == 0 {
        fatalError("g_class != VPaned type")
      }
    }
  }

        public convenience init( ) {
  
  let handle = gtk_vpaned_new()

  self.init(handle: unsafeBitCast(handle, UnsafeMutablePointer<GtkVPaned>.self))
}

}
