import CGTK3
import CGTK3.CGObject
import CGTK3.CGlib2
import CGTK3.CAtk
import CGTK3.CGdk
import CGTK3.CGio

public class RadioAction {
  

  public typealias RawHandle = UnsafeMutablePointer<GtkRadioAction>
  public let handle: RawHandle

  public init(handle: RawHandle) {
    assert(handle != nil, "RadioAction handed a nil handle")
    self.handle = handle

    let type = gtk_radio_action_get_type()
    let inst = unsafeBitCast(handle, UnsafeMutablePointer<GTypeInstance>.self)
    assert(inst.memory.g_class != nil, "g_class for RadioAction was nil")
    if inst.memory.g_class.memory.g_type != type {
      if g_type_check_instance_is_a(inst, type) == 0 {
        fatalError("g_class != RadioAction type")
      }
    }
  }

        public convenience init( name: String, label: String, tooltip: String, stockId: String, value: Int32) {
  
  let handle = gtk_radio_action_new(name, label, tooltip, stockId, value)

  self.init(handle: unsafeBitCast(handle, UnsafeMutablePointer<GtkRadioAction>.self))
}

}
