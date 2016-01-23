import CGTK3
import CGTK3.CGObject
import CGTK3.CGlib2
import CGTK3.CAtk
import CGTK3.CGdk
import CGTK3.CGio

public class ProxyAddress {
  

  public typealias RawHandle = UnsafeMutablePointer<GProxyAddress>
  public let handle: RawHandle

  public init(handle: RawHandle) {
    assert(handle != nil, "ProxyAddress handed a nil handle")
    self.handle = handle

    let type = g_proxy_address_get_type()
    let inst = unsafeBitCast(handle, UnsafeMutablePointer<GTypeInstance>.self)
    assert(inst.memory.g_class != nil, "g_class for ProxyAddress was nil")
    if inst.memory.g_class.memory.g_type != type {
      if g_type_check_instance_is_a(inst, type) == 0 {
        fatalError("g_class != ProxyAddress type")
      }
    }
  }

        public convenience init( inetaddr: UnsafeMutablePointer<GInetAddress>, port: guint16, proto: String, destHostname: String, destPort: guint16, username: String, password: String) {
  
  let handle = g_proxy_address_new(inetaddr, port, proto, destHostname, destPort, username, password)

  self.init(handle: unsafeBitCast(handle, UnsafeMutablePointer<GProxyAddress>.self))
}

}
