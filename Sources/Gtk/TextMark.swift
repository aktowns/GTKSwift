import CGTK3
import CGTK3.CGObject
import CGTK3.CGlib2
import CGTK3.CAtk
import CGTK3.CGdk
import CGTK3.CGio

public class TextMark {
  

  public typealias RawHandle = UnsafeMutablePointer<GtkTextMark>
  public let handle: RawHandle

  public init(handle: RawHandle) {
    assert(handle != nil, "TextMark handed a nil handle")
    self.handle = handle

    let type = gtk_text_mark_get_type()
    let inst = unsafeBitCast(handle, UnsafeMutablePointer<GTypeInstance>.self)
    assert(inst.memory.g_class != nil, "g_class for TextMark was nil")
    if inst.memory.g_class.memory.g_type != type {
      if g_type_check_instance_is_a(inst, type) == 0 {
        fatalError("g_class != TextMark type")
      }
    }
  }

        public convenience init( name: String, leftGravity: Int32) {
  
  let handle = gtk_text_mark_new(name, leftGravity)

  self.init(handle: unsafeBitCast(handle, UnsafeMutablePointer<GtkTextMark>.self))
}

}
