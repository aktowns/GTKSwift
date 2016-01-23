import CGTK3
import CGTK3.CGObject
import CGTK3.CGlib2
import CGTK3.CAtk
import CGTK3.CGdk
import CGTK3.CGio

public class InetSocketAddress {
  

  public typealias RawHandle = UnsafeMutablePointer<GInetSocketAddress>
  public let handle: RawHandle

  public init(handle: RawHandle) {
    assert(handle != nil, "InetSocketAddress handed a nil handle")
    self.handle = handle

    let type = g_inet_socket_address_get_type()
    let inst = unsafeBitCast(handle, UnsafeMutablePointer<GTypeInstance>.self)
    assert(inst.memory.g_class != nil, "g_class for InetSocketAddress was nil")
    if inst.memory.g_class.memory.g_type != type {
      if g_type_check_instance_is_a(inst, type) == 0 {
        fatalError("g_class != InetSocketAddress type")
      }
    }
  }

        public convenience init( address: UnsafeMutablePointer<GInetAddress>, port: guint16) {
  
  let handle = g_inet_socket_address_new(address, port)

  self.init(handle: unsafeBitCast(handle, UnsafeMutablePointer<GInetSocketAddress>.self))
}
 public convenience init(newFromString address: String, port: UInt32) {
  
  let handle = g_inet_socket_address_new_from_string(address, port)

  self.init(handle: unsafeBitCast(handle, UnsafeMutablePointer<GInetSocketAddress>.self))
}

}
