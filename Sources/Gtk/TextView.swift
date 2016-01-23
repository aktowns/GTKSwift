import CGTK3
import CGTK3.CGObject
import CGTK3.CGlib2
import CGTK3.CAtk
import CGTK3.CGdk
import CGTK3.CGio

public class TextView {
  

  public typealias RawHandle = UnsafeMutablePointer<GtkTextView>
  public let handle: RawHandle

  public init(handle: RawHandle) {
    assert(handle != nil, "TextView handed a nil handle")
    self.handle = handle

    let type = gtk_text_view_get_type()
    let inst = unsafeBitCast(handle, UnsafeMutablePointer<GTypeInstance>.self)
    assert(inst.memory.g_class != nil, "g_class for TextView was nil")
    if inst.memory.g_class.memory.g_type != type {
      if g_type_check_instance_is_a(inst, type) == 0 {
        fatalError("g_class != TextView type")
      }
    }
  }

        public convenience init( ) {
  
  let handle = gtk_text_view_new()

  self.init(handle: unsafeBitCast(handle, UnsafeMutablePointer<GtkTextView>.self))
}
 public convenience init(newWithBuffer buffer: UnsafeMutablePointer<GtkTextBuffer>) {
  
  let handle = gtk_text_view_new_with_buffer(buffer)

  self.init(handle: unsafeBitCast(handle, UnsafeMutablePointer<GtkTextView>.self))
}

}
