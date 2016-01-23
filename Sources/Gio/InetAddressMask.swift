import CGTK3
import CGTK3.CGObject
import CGTK3.CGlib2
import CGTK3.CAtk
import CGTK3.CGdk
import CGTK3.CGio

public class InetAddressMask {
  

  public typealias RawHandle = UnsafeMutablePointer<GInetAddressMask>
  public let handle: RawHandle

  public init(handle: RawHandle) {
    assert(handle != nil, "InetAddressMask handed a nil handle")
    self.handle = handle

    let type = g_inet_address_mask_get_type()
    let inst = unsafeBitCast(handle, UnsafeMutablePointer<GTypeInstance>.self)
    assert(inst.memory.g_class != nil, "g_class for InetAddressMask was nil")
    if inst.memory.g_class.memory.g_type != type {
      if g_type_check_instance_is_a(inst, type) == 0 {
        fatalError("g_class != InetAddressMask type")
      }
    }
  }

        public convenience init( addr: UnsafeMutablePointer<GInetAddress>, length: UInt32) {
  var err = UnsafeMutablePointer<GError>.alloc(1)
  let handle = g_inet_address_mask_new(addr, length, &err)

  self.init(handle: unsafeBitCast(handle, UnsafeMutablePointer<GInetAddressMask>.self))
}
 public convenience init(newFromString maskString: String) {
  var err = UnsafeMutablePointer<GError>.alloc(1)
  let handle = g_inet_address_mask_new_from_string(maskString, &err)

  self.init(handle: unsafeBitCast(handle, UnsafeMutablePointer<GInetAddressMask>.self))
}

}
