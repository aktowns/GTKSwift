import CGTK3
import CGTK3.CGObject
import CGTK3.CGlib2
import CGTK3.CAtk
import CGTK3.CGdk
import CGTK3.CGio

public class HScrollbar {
  

  public typealias RawHandle = UnsafeMutablePointer<GtkHScrollbar>
  public let handle: RawHandle

  public init(handle: RawHandle) {
    assert(handle != nil, "HScrollbar handed a nil handle")
    self.handle = handle

    let type = gtk_hscrollbar_get_type()
    let inst = unsafeBitCast(handle, UnsafeMutablePointer<GTypeInstance>.self)
    assert(inst.memory.g_class != nil, "g_class for HScrollbar was nil")
    if inst.memory.g_class.memory.g_type != type {
      if g_type_check_instance_is_a(inst, type) == 0 {
        fatalError("g_class != HScrollbar type")
      }
    }
  }

        public convenience init( adjustment: UnsafeMutablePointer<GtkAdjustment>) {
  
  let handle = gtk_hscrollbar_new(adjustment)

  self.init(handle: unsafeBitCast(handle, UnsafeMutablePointer<GtkHScrollbar>.self))
}

}
