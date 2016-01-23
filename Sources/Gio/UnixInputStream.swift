import CGTK3
import CGTK3.CGObject
import CGTK3.CGlib2
import CGTK3.CAtk
import CGTK3.CGdk
import CGTK3.CGio

public class UnixInputStream {
  

  public typealias RawHandle = UnsafeMutablePointer<GUnixInputStream>
  public let handle: RawHandle

  public init(handle: RawHandle) {
    assert(handle != nil, "UnixInputStream handed a nil handle")
    self.handle = handle

    let type = g_unix_input_stream_get_type()
    let inst = unsafeBitCast(handle, UnsafeMutablePointer<GTypeInstance>.self)
    assert(inst.memory.g_class != nil, "g_class for UnixInputStream was nil")
    if inst.memory.g_class.memory.g_type != type {
      if g_type_check_instance_is_a(inst, type) == 0 {
        fatalError("g_class != UnixInputStream type")
      }
    }
  }

        public convenience init( fd: Int32, closeFd: Int32) {
  
  let handle = g_unix_input_stream_new(fd, closeFd)

  self.init(handle: unsafeBitCast(handle, UnsafeMutablePointer<GUnixInputStream>.self))
}

}
