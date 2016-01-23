import CGTK3
import CGTK3.CGObject
import CGTK3.CGlib2
import CGTK3.CAtk
import CGTK3.CGdk
import CGTK3.CGio

public class Alignment {
  

  public typealias RawHandle = UnsafeMutablePointer<GtkAlignment>
  public let handle: RawHandle

  public init(handle: RawHandle) {
    assert(handle != nil, "Alignment handed a nil handle")
    self.handle = handle

    let type = gtk_alignment_get_type()
    let inst = unsafeBitCast(handle, UnsafeMutablePointer<GTypeInstance>.self)
    assert(inst.memory.g_class != nil, "g_class for Alignment was nil")
    if inst.memory.g_class.memory.g_type != type {
      if g_type_check_instance_is_a(inst, type) == 0 {
        fatalError("g_class != Alignment type")
      }
    }
  }

        public convenience init( xalign: Float, yalign: Float, xscale: Float, yscale: Float) {
  
  let handle = gtk_alignment_new(xalign, yalign, xscale, yscale)

  self.init(handle: unsafeBitCast(handle, UnsafeMutablePointer<GtkAlignment>.self))
}

}
