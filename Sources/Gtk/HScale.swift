import CGTK3
import CGTK3.CGObject
import CGTK3.CGlib2
import CGTK3.CAtk
import CGTK3.CGdk
import CGTK3.CGio

public class HScale {
  

  public typealias RawHandle = UnsafeMutablePointer<GtkHScale>
  public let handle: RawHandle

  public init(handle: RawHandle) {
    assert(handle != nil, "HScale handed a nil handle")
    self.handle = handle

    let type = gtk_hscale_get_type()
    let inst = unsafeBitCast(handle, UnsafeMutablePointer<GTypeInstance>.self)
    assert(inst.memory.g_class != nil, "g_class for HScale was nil")
    if inst.memory.g_class.memory.g_type != type {
      if g_type_check_instance_is_a(inst, type) == 0 {
        fatalError("g_class != HScale type")
      }
    }
  }

        public convenience init( adjustment: UnsafeMutablePointer<GtkAdjustment>) {
  
  let handle = gtk_hscale_new(adjustment)

  self.init(handle: unsafeBitCast(handle, UnsafeMutablePointer<GtkHScale>.self))
}
 public convenience init(newWithRange min: Double, max: Double, step: Double) {
  
  let handle = gtk_hscale_new_with_range(min, max, step)

  self.init(handle: unsafeBitCast(handle, UnsafeMutablePointer<GtkHScale>.self))
}

}
