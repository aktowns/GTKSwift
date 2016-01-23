import CGTK3
import CGTK3.CGObject
import CGTK3.CGlib2
import CGTK3.CAtk
import CGTK3.CGdk
import CGTK3.CGio

public class UnixFDMessage {
  

  public typealias RawHandle = UnsafeMutablePointer<GUnixFDMessage>
  public let handle: RawHandle

  public init(handle: RawHandle) {
    assert(handle != nil, "UnixFDMessage handed a nil handle")
    self.handle = handle

    let type = g_unix_fd_message_get_type()
    let inst = unsafeBitCast(handle, UnsafeMutablePointer<GTypeInstance>.self)
    assert(inst.memory.g_class != nil, "g_class for UnixFDMessage was nil")
    if inst.memory.g_class.memory.g_type != type {
      if g_type_check_instance_is_a(inst, type) == 0 {
        fatalError("g_class != UnixFDMessage type")
      }
    }
  }

        public convenience init( ) {
  
  let handle = g_unix_fd_message_new()

  self.init(handle: unsafeBitCast(handle, UnsafeMutablePointer<GUnixFDMessage>.self))
}
 public convenience init(newWithFdList fdList: UnsafeMutablePointer<GUnixFDList>) {
  
  let handle = g_unix_fd_message_new_with_fd_list(fdList)

  self.init(handle: unsafeBitCast(handle, UnsafeMutablePointer<GUnixFDMessage>.self))
}

}
