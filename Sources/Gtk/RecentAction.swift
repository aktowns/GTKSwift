import CGTK3
import CGTK3.CGObject
import CGTK3.CGlib2
import CGTK3.CAtk
import CGTK3.CGdk
import CGTK3.CGio

public class RecentAction {
  

  public typealias RawHandle = UnsafeMutablePointer<GtkRecentAction>
  public let handle: RawHandle

  public init(handle: RawHandle) {
    assert(handle != nil, "RecentAction handed a nil handle")
    self.handle = handle

    let type = gtk_recent_action_get_type()
    let inst = unsafeBitCast(handle, UnsafeMutablePointer<GTypeInstance>.self)
    assert(inst.memory.g_class != nil, "g_class for RecentAction was nil")
    if inst.memory.g_class.memory.g_type != type {
      if g_type_check_instance_is_a(inst, type) == 0 {
        fatalError("g_class != RecentAction type")
      }
    }
  }

        public convenience init( name: String, label: String, tooltip: String, stockId: String) {
  
  let handle = gtk_recent_action_new(name, label, tooltip, stockId)

  self.init(handle: unsafeBitCast(handle, UnsafeMutablePointer<GtkRecentAction>.self))
}
 public convenience init(newForManager name: String, label: String, tooltip: String, stockId: String, manager: UnsafeMutablePointer<GtkRecentManager>) {
  
  let handle = gtk_recent_action_new_for_manager(name, label, tooltip, stockId, manager)

  self.init(handle: unsafeBitCast(handle, UnsafeMutablePointer<GtkRecentAction>.self))
}

}
