import CGTK3
import CGTK3.CGObject
import CGTK3.CGlib2
import CGTK3.CAtk
import CGTK3.CGdk
import CGTK3.CGio

public class AspectFrame {
  

  public typealias RawHandle = UnsafeMutablePointer<GtkAspectFrame>
  public let handle: RawHandle

  public init(handle: RawHandle) {
    assert(handle != nil, "AspectFrame handed a nil handle")
    self.handle = handle

    let type = gtk_aspect_frame_get_type()
    let inst = unsafeBitCast(handle, UnsafeMutablePointer<GTypeInstance>.self)
    assert(inst.memory.g_class != nil, "g_class for AspectFrame was nil")
    if inst.memory.g_class.memory.g_type != type {
      if g_type_check_instance_is_a(inst, type) == 0 {
        fatalError("g_class != AspectFrame type")
      }
    }
  }

        public convenience init( label: String, xalign: Float, yalign: Float, ratio: Float, obeyChild: Int32) {
  
  let handle = gtk_aspect_frame_new(label, xalign, yalign, ratio, obeyChild)

  self.init(handle: unsafeBitCast(handle, UnsafeMutablePointer<GtkAspectFrame>.self))
}

}
