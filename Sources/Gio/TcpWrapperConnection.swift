import CGTK3
import CGTK3.CGObject
import CGTK3.CGlib2
import CGTK3.CAtk
import CGTK3.CGdk
import CGTK3.CGio

public class TcpWrapperConnection {
  

  public typealias RawHandle = UnsafeMutablePointer<GTcpWrapperConnection>
  public let handle: RawHandle

  public init(handle: RawHandle) {
    assert(handle != nil, "TcpWrapperConnection handed a nil handle")
    self.handle = handle

    let type = g_tcp_wrapper_connection_get_type()
    let inst = unsafeBitCast(handle, UnsafeMutablePointer<GTypeInstance>.self)
    assert(inst.memory.g_class != nil, "g_class for TcpWrapperConnection was nil")
    if inst.memory.g_class.memory.g_type != type {
      if g_type_check_instance_is_a(inst, type) == 0 {
        fatalError("g_class != TcpWrapperConnection type")
      }
    }
  }

        public convenience init( baseIoStream: UnsafeMutablePointer<GIOStream>, socket: UnsafeMutablePointer<GSocket>) {
  
  let handle = g_tcp_wrapper_connection_new(baseIoStream, socket)

  self.init(handle: unsafeBitCast(handle, UnsafeMutablePointer<GTcpWrapperConnection>.self))
}

}
