import CGTK3
import CGTK3.CGObject
import CGTK3.CGlib2
import CGTK3.CAtk
import CGTK3.CGdk
import CGTK3.CGio

public class ToolButton {
  

  public typealias RawHandle = UnsafeMutablePointer<GtkToolButton>
  public let handle: RawHandle

  public init(handle: RawHandle) {
    assert(handle != nil, "ToolButton handed a nil handle")
    self.handle = handle

    let type = gtk_tool_button_get_type()
    let inst = unsafeBitCast(handle, UnsafeMutablePointer<GTypeInstance>.self)
    assert(inst.memory.g_class != nil, "g_class for ToolButton was nil")
    if inst.memory.g_class.memory.g_type != type {
      if g_type_check_instance_is_a(inst, type) == 0 {
        fatalError("g_class != ToolButton type")
      }
    }
  }

        public convenience init( iconWidget: UnsafeMutablePointer<GtkWidget>, label: String) {
  
  let handle = gtk_tool_button_new(iconWidget, label)

  self.init(handle: unsafeBitCast(handle, UnsafeMutablePointer<GtkToolButton>.self))
}
 public convenience init(newFromStock stockId: String) {
  
  let handle = gtk_tool_button_new_from_stock(stockId)

  self.init(handle: unsafeBitCast(handle, UnsafeMutablePointer<GtkToolButton>.self))
}

}
