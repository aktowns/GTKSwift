import CGTK3
import CGTK3.CGObject
import CGTK3.CGlib2
import CGTK3.CAtk
import CGTK3.CGdk
import CGTK3.CGio

public class Action {
  

  public typealias RawHandle = UnsafeMutablePointer<GtkAction>
  public let handle: RawHandle

  public init(handle: RawHandle) {
    assert(handle != nil, "Action handed a nil handle")
    self.handle = handle

    let type = gtk_action_get_type()
    let inst = unsafeBitCast(handle, UnsafeMutablePointer<GTypeInstance>.self)
    assert(inst.memory.g_class != nil, "g_class for Action was nil")
    if inst.memory.g_class.memory.g_type != type {
      if g_type_check_instance_is_a(inst, type) == 0 {
        fatalError("g_class != Action type")
      }
    }
  }

        public convenience init( name: String, label: String, tooltip: String, stockId: String) {
  
  let handle = gtk_action_new(name, label, tooltip, stockId)

  self.init(handle: unsafeBitCast(handle, UnsafeMutablePointer<GtkAction>.self))
}

}
