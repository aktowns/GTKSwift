import CGTK3
import CGTK3.CGObject
import CGTK3.CGlib2
import CGTK3.CAtk
import CGTK3.CGdk
import CGTK3.CGio

public class FileInputStream {
  

  public typealias RawHandle = UnsafeMutablePointer<GFileInputStream>
  public let handle: RawHandle

  public init(handle: RawHandle) {
    assert(handle != nil, "FileInputStream handed a nil handle")
    self.handle = handle

    let type = g_file_input_stream_get_type()
    let inst = unsafeBitCast(handle, UnsafeMutablePointer<GTypeInstance>.self)
    assert(inst.memory.g_class != nil, "g_class for FileInputStream was nil")
    if inst.memory.g_class.memory.g_type != type {
      if g_type_check_instance_is_a(inst, type) == 0 {
        fatalError("g_class != FileInputStream type")
      }
    }
  }

  
}
