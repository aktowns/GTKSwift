import CGTK3
import CGTK3.CGObject
import CGTK3.CGlib2
import CGTK3.CAtk
import CGTK3.CGdk
import CGTK3.CGio

public class SpinButton {
  

  public typealias RawHandle = UnsafeMutablePointer<GtkSpinButton>
  public let handle: RawHandle

  public init(handle: RawHandle) {
    assert(handle != nil, "SpinButton handed a nil handle")
    self.handle = handle

    let type = gtk_spin_button_get_type()
    let inst = unsafeBitCast(handle, UnsafeMutablePointer<GTypeInstance>.self)
    assert(inst.memory.g_class != nil, "g_class for SpinButton was nil")
    if inst.memory.g_class.memory.g_type != type {
      if g_type_check_instance_is_a(inst, type) == 0 {
        fatalError("g_class != SpinButton type")
      }
    }
  }

        public convenience init( adjustment: UnsafeMutablePointer<GtkAdjustment>, climbRate: Double, digits: UInt32) {
  
  let handle = gtk_spin_button_new(adjustment, climbRate, digits)

  self.init(handle: unsafeBitCast(handle, UnsafeMutablePointer<GtkSpinButton>.self))
}
 public convenience init(newWithRange min: Double, max: Double, step: Double) {
  
  let handle = gtk_spin_button_new_with_range(min, max, step)

  self.init(handle: unsafeBitCast(handle, UnsafeMutablePointer<GtkSpinButton>.self))
}

}
