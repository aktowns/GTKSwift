import CGTK3
import CGTK3.CGObject
import CGTK3.CGlib2
import CGTK3.CAtk
import CGTK3.CGdk
import CGTK3.CGio

public class LockButton {
  

  public typealias RawHandle = UnsafeMutablePointer<GtkLockButton>
  public let handle: RawHandle

  public init(handle: RawHandle) {
    assert(handle != nil, "LockButton handed a nil handle")
    self.handle = handle

    let type = gtk_lock_button_get_type()
    let inst = unsafeBitCast(handle, UnsafeMutablePointer<GTypeInstance>.self)
    assert(inst.memory.g_class != nil, "g_class for LockButton was nil")
    if inst.memory.g_class.memory.g_type != type {
      if g_type_check_instance_is_a(inst, type) == 0 {
        fatalError("g_class != LockButton type")
      }
    }
  }

        public convenience init( permission: UnsafeMutablePointer<GPermission>) {
  
  let handle = gtk_lock_button_new(permission)

  self.init(handle: unsafeBitCast(handle, UnsafeMutablePointer<GtkLockButton>.self))
}

}
