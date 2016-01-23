import CGTK3
import CGTK3.CGObject
import CGTK3.CGlib2
import CGTK3.CAtk
import CGTK3.CGdk
import CGTK3.CGio

public class RecentChooserWidget {
  

  public typealias RawHandle = UnsafeMutablePointer<GtkRecentChooserWidget>
  public let handle: RawHandle

  public init(handle: RawHandle) {
    assert(handle != nil, "RecentChooserWidget handed a nil handle")
    self.handle = handle

    let type = gtk_recent_chooser_widget_get_type()
    let inst = unsafeBitCast(handle, UnsafeMutablePointer<GTypeInstance>.self)
    assert(inst.memory.g_class != nil, "g_class for RecentChooserWidget was nil")
    if inst.memory.g_class.memory.g_type != type {
      if g_type_check_instance_is_a(inst, type) == 0 {
        fatalError("g_class != RecentChooserWidget type")
      }
    }
  }

        public convenience init( ) {
  
  let handle = gtk_recent_chooser_widget_new()

  self.init(handle: unsafeBitCast(handle, UnsafeMutablePointer<GtkRecentChooserWidget>.self))
}
 public convenience init(newForManager manager: UnsafeMutablePointer<GtkRecentManager>) {
  
  let handle = gtk_recent_chooser_widget_new_for_manager(manager)

  self.init(handle: unsafeBitCast(handle, UnsafeMutablePointer<GtkRecentChooserWidget>.self))
}

}
