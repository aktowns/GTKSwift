import CGTK3
import CGTK3.CGObject
import CGTK3.CGlib2
import CGTK3.CAtk
import CGTK3.CGdk
import CGTK3.CGio

public class BufferedOutputStream {
  

  public typealias RawHandle = UnsafeMutablePointer<GBufferedOutputStream>
  public let handle: RawHandle

  public init(handle: RawHandle) {
    assert(handle != nil, "BufferedOutputStream handed a nil handle")
    self.handle = handle

    let type = g_buffered_output_stream_get_type()
    let inst = unsafeBitCast(handle, UnsafeMutablePointer<GTypeInstance>.self)
    assert(inst.memory.g_class != nil, "g_class for BufferedOutputStream was nil")
    if inst.memory.g_class.memory.g_type != type {
      if g_type_check_instance_is_a(inst, type) == 0 {
        fatalError("g_class != BufferedOutputStream type")
      }
    }
  }

        public convenience init( baseStream: UnsafeMutablePointer<GOutputStream>) {
  
  let handle = g_buffered_output_stream_new(baseStream)

  self.init(handle: unsafeBitCast(handle, UnsafeMutablePointer<GBufferedOutputStream>.self))
}
 public convenience init(newSized baseStream: UnsafeMutablePointer<GOutputStream>, size: gsize) {
  
  let handle = g_buffered_output_stream_new_sized(baseStream, size)

  self.init(handle: unsafeBitCast(handle, UnsafeMutablePointer<GBufferedOutputStream>.self))
}

}
