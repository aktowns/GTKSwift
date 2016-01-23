import CGTK3
import CGTK3.CGObject
import CGTK3.CGlib2
import CGTK3.CAtk
import CGTK3.CGdk
import CGTK3.CGio

public class DBusObjectSkeleton {
  

  public typealias RawHandle = UnsafeMutablePointer<GDBusObjectSkeleton>
  public let handle: RawHandle

  public init(handle: RawHandle) {
    assert(handle != nil, "DBusObjectSkeleton handed a nil handle")
    self.handle = handle

    let type = g_dbus_object_skeleton_get_type()
    let inst = unsafeBitCast(handle, UnsafeMutablePointer<GTypeInstance>.self)
    assert(inst.memory.g_class != nil, "g_class for DBusObjectSkeleton was nil")
    if inst.memory.g_class.memory.g_type != type {
      if g_type_check_instance_is_a(inst, type) == 0 {
        fatalError("g_class != DBusObjectSkeleton type")
      }
    }
  }

        public convenience init( objectPath: String) {
  
  let handle = g_dbus_object_skeleton_new(objectPath)

  self.init(handle: unsafeBitCast(handle, UnsafeMutablePointer<GDBusObjectSkeleton>.self))
}

}
