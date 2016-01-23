import CGTK3
import CGTK3.CGObject
import CGTK3.CGlib2
import CGTK3.CAtk
import CGTK3.CGdk
import CGTK3.CGio

public class Scale {
  

  public typealias RawHandle = UnsafeMutablePointer<GtkScale>
  public let handle: RawHandle

  public init(handle: RawHandle) {
    assert(handle != nil, "Scale handed a nil handle")
    self.handle = handle

    let type = gtk_scale_get_type()
    let inst = unsafeBitCast(handle, UnsafeMutablePointer<GTypeInstance>.self)
    assert(inst.memory.g_class != nil, "g_class for Scale was nil")
    if inst.memory.g_class.memory.g_type != type {
      if g_type_check_instance_is_a(inst, type) == 0 {
        fatalError("g_class != Scale type")
      }
    }
  }

        public convenience init( orientation: GtkOrientation, adjustment: UnsafeMutablePointer<GtkAdjustment>) {
  
  let handle = gtk_scale_new(orientation, adjustment)

  self.init(handle: unsafeBitCast(handle, UnsafeMutablePointer<GtkScale>.self))
}
 public convenience init(newWithRange orientation: GtkOrientation, min: Double, max: Double, step: Double) {
  
  let handle = gtk_scale_new_with_range(orientation, min, max, step)

  self.init(handle: unsafeBitCast(handle, UnsafeMutablePointer<GtkScale>.self))
}

}
