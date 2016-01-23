import CGTK3
import CGTK3.CGObject
import CGTK3.CGlib2
import CGTK3.CAtk
import CGTK3.CGdk
import CGTK3.CGio

public class ToolItemGroup {
  

  public typealias RawHandle = UnsafeMutablePointer<GtkToolItemGroup>
  public let handle: RawHandle

  public init(handle: RawHandle) {
    assert(handle != nil, "ToolItemGroup handed a nil handle")
    self.handle = handle

    let type = gtk_tool_item_group_get_type()
    let inst = unsafeBitCast(handle, UnsafeMutablePointer<GTypeInstance>.self)
    assert(inst.memory.g_class != nil, "g_class for ToolItemGroup was nil")
    if inst.memory.g_class.memory.g_type != type {
      if g_type_check_instance_is_a(inst, type) == 0 {
        fatalError("g_class != ToolItemGroup type")
      }
    }
  }

        public convenience init( label: String) {
  
  let handle = gtk_tool_item_group_new(label)

  self.init(handle: unsafeBitCast(handle, UnsafeMutablePointer<GtkToolItemGroup>.self))
}

}
