import CGTK3
import CGTK3.CGObject
import CGTK3.CGlib2
import CGTK3.CAtk
import CGTK3.CGdk
import CGTK3.CGio

public class Popover {
  

  public typealias RawHandle = UnsafeMutablePointer<GtkPopover>
  public let handle: RawHandle

  public init(handle: RawHandle) {
    assert(handle != nil, "Popover handed a nil handle")
    self.handle = handle

    let type = gtk_popover_get_type()
    let inst = unsafeBitCast(handle, UnsafeMutablePointer<GTypeInstance>.self)
    assert(inst.memory.g_class != nil, "g_class for Popover was nil")
    if inst.memory.g_class.memory.g_type != type {
      if g_type_check_instance_is_a(inst, type) == 0 {
        fatalError("g_class != Popover type")
      }
    }
  }

        public convenience init( relativeTo: UnsafeMutablePointer<GtkWidget>) {
  
  let handle = gtk_popover_new(relativeTo)

  self.init(handle: unsafeBitCast(handle, UnsafeMutablePointer<GtkPopover>.self))
}
 public convenience init(newFromModel relativeTo: UnsafeMutablePointer<GtkWidget>, model: UnsafeMutablePointer<GMenuModel>) {
  
  let handle = gtk_popover_new_from_model(relativeTo, model)

  self.init(handle: unsafeBitCast(handle, UnsafeMutablePointer<GtkPopover>.self))
}

}
