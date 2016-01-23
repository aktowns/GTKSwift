import CGTK3
import CGTK3.CGObject
import CGTK3.CGlib2
import CGTK3.CAtk
import CGTK3.CGdk
import CGTK3.CGio

public class UnixOutputStream {
  

  public typealias RawHandle = UnsafeMutablePointer<GUnixOutputStream>
  public let handle: RawHandle

  public init(handle: RawHandle) {
    assert(handle != nil, "UnixOutputStream handed a nil handle")
    self.handle = handle

    let type = g_unix_output_stream_get_type()
    let inst = unsafeBitCast(handle, UnsafeMutablePointer<GTypeInstance>.self)
    assert(inst.memory.g_class != nil, "g_class for UnixOutputStream was nil")
    if inst.memory.g_class.memory.g_type != type {
      if g_type_check_instance_is_a(inst, type) == 0 {
        fatalError("g_class != UnixOutputStream type")
      }
    }
  }

        public convenience init( fd: Int32, closeFd: Int32) {
  
  let handle = g_unix_output_stream_new(fd, closeFd)

  self.init(handle: unsafeBitCast(handle, UnsafeMutablePointer<GUnixOutputStream>.self))
}

}
