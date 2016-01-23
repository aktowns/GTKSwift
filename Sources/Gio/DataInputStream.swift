import CGTK3
import CGTK3.CGObject
import CGTK3.CGlib2
import CGTK3.CAtk
import CGTK3.CGdk
import CGTK3.CGio

public class DataInputStream {
  

  public typealias RawHandle = UnsafeMutablePointer<GDataInputStream>
  public let handle: RawHandle

  public init(handle: RawHandle) {
    assert(handle != nil, "DataInputStream handed a nil handle")
    self.handle = handle

    let type = g_data_input_stream_get_type()
    let inst = unsafeBitCast(handle, UnsafeMutablePointer<GTypeInstance>.self)
    assert(inst.memory.g_class != nil, "g_class for DataInputStream was nil")
    if inst.memory.g_class.memory.g_type != type {
      if g_type_check_instance_is_a(inst, type) == 0 {
        fatalError("g_class != DataInputStream type")
      }
    }
  }

        public convenience init( baseStream: UnsafeMutablePointer<GInputStream>) {
  
  let handle = g_data_input_stream_new(baseStream)

  self.init(handle: unsafeBitCast(handle, UnsafeMutablePointer<GDataInputStream>.self))
}

}
