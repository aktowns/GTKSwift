import CGTK3
import CGTK3.CGObject
import CGTK3.CGlib2
import CGTK3.CAtk
import CGTK3.CGdk
import CGTK3.CGio

public class Socket {
  

  public typealias RawHandle = UnsafeMutablePointer<GSocket>
  public let handle: RawHandle

  public init(handle: RawHandle) {
    assert(handle != nil, "Socket handed a nil handle")
    self.handle = handle

    let type = g_socket_get_type()
    let inst = unsafeBitCast(handle, UnsafeMutablePointer<GTypeInstance>.self)
    assert(inst.memory.g_class != nil, "g_class for Socket was nil")
    if inst.memory.g_class.memory.g_type != type {
      if g_type_check_instance_is_a(inst, type) == 0 {
        fatalError("g_class != Socket type")
      }
    }
  }

        public convenience init( family: GSocketFamily, type: GSocketType, proto: GSocketProtocol) {
  var err = UnsafeMutablePointer<GError>.alloc(1)
  let handle = g_socket_new(family, type, proto, &err)

  self.init(handle: unsafeBitCast(handle, UnsafeMutablePointer<GSocket>.self))
}
 public convenience init(newFromFd fd: Int32) {
  var err = UnsafeMutablePointer<GError>.alloc(1)
  let handle = g_socket_new_from_fd(fd, &err)

  self.init(handle: unsafeBitCast(handle, UnsafeMutablePointer<GSocket>.self))
}

}
