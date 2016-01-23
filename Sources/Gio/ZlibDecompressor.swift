import CGTK3
import CGTK3.CGObject
import CGTK3.CGlib2
import CGTK3.CAtk
import CGTK3.CGdk
import CGTK3.CGio

public class ZlibDecompressor {
  

  public typealias RawHandle = GZlibDecompressor
  public let handle: RawHandle

  public init(handle: RawHandle) {
    assert(handle != nil, "ZlibDecompressor handed a nil handle")
    self.handle = handle

    let type = g_zlib_decompressor_get_type()
    let inst = unsafeBitCast(handle, UnsafeMutablePointer<GTypeInstance>.self)
    assert(inst.memory.g_class != nil, "g_class for ZlibDecompressor was nil")
    if inst.memory.g_class.memory.g_type != type {
      if g_type_check_instance_is_a(inst, type) == 0 {
        fatalError("g_class != ZlibDecompressor type")
      }
    }
  }

        public convenience init( format: GZlibCompressorFormat) {
  
  let handle = g_zlib_decompressor_new(format)

  self.init(handle: unsafeBitCast(handle, GZlibDecompressor.self))
}

}
