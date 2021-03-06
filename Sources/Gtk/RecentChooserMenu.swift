import CGTK3
import CGTK3.CGObject
import CGTK3.CGlib2
import CGTK3.CAtk
import CGTK3.CGdk
import CGTK3.CGio

public class RecentChooserMenu {
  

  public typealias RawHandle = UnsafeMutablePointer<GtkRecentChooserMenu>
  public let handle: RawHandle

  public init(handle: RawHandle) {
    assert(handle != nil, "RecentChooserMenu handed a nil handle")
    self.handle = handle

    let type = gtk_recent_chooser_menu_get_type()
    let inst = unsafeBitCast(handle, UnsafeMutablePointer<GTypeInstance>.self)
    assert(inst.memory.g_class != nil, "g_class for RecentChooserMenu was nil")
    if inst.memory.g_class.memory.g_type != type {
      if g_type_check_instance_is_a(inst, type) == 0 {
        fatalError("g_class != RecentChooserMenu type")
      }
    }
  }

        public convenience init( ) {
  
  let handle = gtk_recent_chooser_menu_new()

  self.init(handle: unsafeBitCast(handle, UnsafeMutablePointer<GtkRecentChooserMenu>.self))
}
 public convenience init(newForManager manager: UnsafeMutablePointer<GtkRecentManager>) {
  
  let handle = gtk_recent_chooser_menu_new_for_manager(manager)

  self.init(handle: unsafeBitCast(handle, UnsafeMutablePointer<GtkRecentChooserMenu>.self))
}

}
