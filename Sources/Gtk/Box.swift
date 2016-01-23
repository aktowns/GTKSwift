import CGTK3
import CGTK3.CGObject
import CGTK3.CGlib2
import CGTK3.CAtk
import CGTK3.CGdk
import CGTK3.CGio

public class Box {
  

  public typealias RawHandle = UnsafeMutablePointer<GtkBox>
  public let handle: RawHandle

  public init(handle: RawHandle) {
    assert(handle != nil, "Box handed a nil handle")
    self.handle = handle

    let type = gtk_box_get_type()
    let inst = unsafeBitCast(handle, UnsafeMutablePointer<GTypeInstance>.self)
    assert(inst.memory.g_class != nil, "g_class for Box was nil")
    if inst.memory.g_class.memory.g_type != type {
      if g_type_check_instance_is_a(inst, type) == 0 {
        fatalError("g_class != Box type")
      }
    }
  }

        public convenience init( orientation: GtkOrientation, spacing: Int32) {
  
  let handle = gtk_box_new(orientation, spacing)

  self.init(handle: unsafeBitCast(handle, UnsafeMutablePointer<GtkBox>.self))
}

}
