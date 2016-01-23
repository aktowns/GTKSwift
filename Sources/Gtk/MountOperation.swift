import CGTK3
import CGTK3.CGObject
import CGTK3.CGlib2
import CGTK3.CAtk
import CGTK3.CGdk
import CGTK3.CGio

public class MountOperation {
  

  public typealias RawHandle = UnsafeMutablePointer<GtkMountOperation>
  public let handle: RawHandle

  public init(handle: RawHandle) {
    assert(handle != nil, "MountOperation handed a nil handle")
    self.handle = handle

    let type = gtk_mount_operation_get_type()
    let inst = unsafeBitCast(handle, UnsafeMutablePointer<GTypeInstance>.self)
    assert(inst.memory.g_class != nil, "g_class for MountOperation was nil")
    if inst.memory.g_class.memory.g_type != type {
      if g_type_check_instance_is_a(inst, type) == 0 {
        fatalError("g_class != MountOperation type")
      }
    }
  }

        public convenience init( parent: UnsafeMutablePointer<GtkWindow>) {
  
  let handle = gtk_mount_operation_new(parent)

  self.init(handle: unsafeBitCast(handle, UnsafeMutablePointer<GtkMountOperation>.self))
}

}
