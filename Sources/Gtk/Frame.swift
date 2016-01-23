import CGTK3
import CGTK3.CGObject
import CGTK3.CGlib2
import CGTK3.CAtk
import CGTK3.CGdk
import CGTK3.CGio

public class Frame {
  

  public typealias RawHandle = UnsafeMutablePointer<GtkFrame>
  public let handle: RawHandle

  public init(handle: RawHandle) {
    assert(handle != nil, "Frame handed a nil handle")
    self.handle = handle

    let type = gtk_frame_get_type()
    let inst = unsafeBitCast(handle, UnsafeMutablePointer<GTypeInstance>.self)
    assert(inst.memory.g_class != nil, "g_class for Frame was nil")
    if inst.memory.g_class.memory.g_type != type {
      if g_type_check_instance_is_a(inst, type) == 0 {
        fatalError("g_class != Frame type")
      }
    }
  }

        public convenience init( label: String) {
  
  let handle = gtk_frame_new(label)

  self.init(handle: unsafeBitCast(handle, UnsafeMutablePointer<GtkFrame>.self))
}

}
