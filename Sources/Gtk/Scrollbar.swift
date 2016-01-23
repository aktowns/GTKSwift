import CGTK3
import CGTK3.CGObject
import CGTK3.CGlib2
import CGTK3.CAtk
import CGTK3.CGdk
import CGTK3.CGio

public class Scrollbar {
  

  public typealias RawHandle = UnsafeMutablePointer<GtkScrollbar>
  public let handle: RawHandle

  public init(handle: RawHandle) {
    assert(handle != nil, "Scrollbar handed a nil handle")
    self.handle = handle

    let type = gtk_scrollbar_get_type()
    let inst = unsafeBitCast(handle, UnsafeMutablePointer<GTypeInstance>.self)
    assert(inst.memory.g_class != nil, "g_class for Scrollbar was nil")
    if inst.memory.g_class.memory.g_type != type {
      if g_type_check_instance_is_a(inst, type) == 0 {
        fatalError("g_class != Scrollbar type")
      }
    }
  }

        public convenience init( orientation: GtkOrientation, adjustment: UnsafeMutablePointer<GtkAdjustment>) {
  
  let handle = gtk_scrollbar_new(orientation, adjustment)

  self.init(handle: unsafeBitCast(handle, UnsafeMutablePointer<GtkScrollbar>.self))
}

}
