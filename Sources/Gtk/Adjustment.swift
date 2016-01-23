import CGTK3
import CGTK3.CGObject
import CGTK3.CGlib2
import CGTK3.CAtk
import CGTK3.CGdk
import CGTK3.CGio

public class Adjustment {
  

  public typealias RawHandle = UnsafeMutablePointer<GtkAdjustment>
  public let handle: RawHandle

  public init(handle: RawHandle) {
    assert(handle != nil, "Adjustment handed a nil handle")
    self.handle = handle

    let type = gtk_adjustment_get_type()
    let inst = unsafeBitCast(handle, UnsafeMutablePointer<GTypeInstance>.self)
    assert(inst.memory.g_class != nil, "g_class for Adjustment was nil")
    if inst.memory.g_class.memory.g_type != type {
      if g_type_check_instance_is_a(inst, type) == 0 {
        fatalError("g_class != Adjustment type")
      }
    }
  }

        public convenience init( value: Double, lower: Double, upper: Double, stepIncrement: Double, pageIncrement: Double, pageSize: Double) {
  
  let handle = gtk_adjustment_new(value, lower, upper, stepIncrement, pageIncrement, pageSize)

  self.init(handle: unsafeBitCast(handle, UnsafeMutablePointer<GtkAdjustment>.self))
}

}
