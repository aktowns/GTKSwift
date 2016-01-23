import CGTK3
import CGTK3.CGObject
import CGTK3.CGlib2
import CGTK3.CAtk
import CGTK3.CGdk
import CGTK3.CGio

public class CharsetConverter {
  

  public typealias RawHandle = GCharsetConverter
  public let handle: RawHandle

  public init(handle: RawHandle) {
    assert(handle != nil, "CharsetConverter handed a nil handle")
    self.handle = handle

    let type = g_charset_converter_get_type()
    let inst = unsafeBitCast(handle, UnsafeMutablePointer<GTypeInstance>.self)
    assert(inst.memory.g_class != nil, "g_class for CharsetConverter was nil")
    if inst.memory.g_class.memory.g_type != type {
      if g_type_check_instance_is_a(inst, type) == 0 {
        fatalError("g_class != CharsetConverter type")
      }
    }
  }

        public convenience init( toCharset: String, fromCharset: String) {
  var err = UnsafeMutablePointer<GError>.alloc(1)
  let handle = g_charset_converter_new(toCharset, fromCharset, &err)

  self.init(handle: unsafeBitCast(handle, GCharsetConverter.self))
}

}
