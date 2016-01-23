import CGTK3
import CGTK3.CGObject
import CGTK3.CGlib2
import CGTK3.CAtk
import CGTK3.CGdk
import CGTK3.CGio

public class ButtonBox {
  

  public typealias RawHandle = UnsafeMutablePointer<GtkButtonBox>
  public let handle: RawHandle

  public init(handle: RawHandle) {
    assert(handle != nil, "ButtonBox handed a nil handle")
    self.handle = handle

    let type = gtk_button_box_get_type()
    let inst = unsafeBitCast(handle, UnsafeMutablePointer<GTypeInstance>.self)
    assert(inst.memory.g_class != nil, "g_class for ButtonBox was nil")
    if inst.memory.g_class.memory.g_type != type {
      if g_type_check_instance_is_a(inst, type) == 0 {
        fatalError("g_class != ButtonBox type")
      }
    }
  }

        public convenience init( orientation: GtkOrientation) {
  
  let handle = gtk_button_box_new(orientation)

  self.init(handle: unsafeBitCast(handle, UnsafeMutablePointer<GtkButtonBox>.self))
}

}
