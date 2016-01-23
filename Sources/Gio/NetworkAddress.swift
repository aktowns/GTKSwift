import CGTK3
import CGTK3.CGObject
import CGTK3.CGlib2
import CGTK3.CAtk
import CGTK3.CGdk
import CGTK3.CGio

public class NetworkAddress {
  

  public typealias RawHandle = UnsafeMutablePointer<GNetworkAddress>
  public let handle: RawHandle

  public init(handle: RawHandle) {
    assert(handle != nil, "NetworkAddress handed a nil handle")
    self.handle = handle

    let type = g_network_address_get_type()
    let inst = unsafeBitCast(handle, UnsafeMutablePointer<GTypeInstance>.self)
    assert(inst.memory.g_class != nil, "g_class for NetworkAddress was nil")
    if inst.memory.g_class.memory.g_type != type {
      if g_type_check_instance_is_a(inst, type) == 0 {
        fatalError("g_class != NetworkAddress type")
      }
    }
  }

        public convenience init( hostname: String, port: guint16) {
  
  let handle = g_network_address_new(hostname, port)

  self.init(handle: unsafeBitCast(handle, UnsafeMutablePointer<GNetworkAddress>.self))
}
 public convenience init(newLoopback port: guint16) {
  
  let handle = g_network_address_new_loopback(port)

  self.init(handle: unsafeBitCast(handle, UnsafeMutablePointer<GNetworkAddress>.self))
}

}
