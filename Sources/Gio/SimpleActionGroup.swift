import CGTK3
import CGTK3.CGObject
import CGTK3.CGlib2
import CGTK3.CAtk
import CGTK3.CGdk
import CGTK3.CGio

public class SimpleActionGroup {
  

  public typealias RawHandle = UnsafeMutablePointer<GSimpleActionGroup>
  public let handle: RawHandle

  public init(handle: RawHandle) {
    assert(handle != nil, "SimpleActionGroup handed a nil handle")
    self.handle = handle

    let type = g_simple_action_group_get_type()
    let inst = unsafeBitCast(handle, UnsafeMutablePointer<GTypeInstance>.self)
    assert(inst.memory.g_class != nil, "g_class for SimpleActionGroup was nil")
    if inst.memory.g_class.memory.g_type != type {
      if g_type_check_instance_is_a(inst, type) == 0 {
        fatalError("g_class != SimpleActionGroup type")
      }
    }
  }

        public convenience init( ) {
  
  let handle = g_simple_action_group_new()

  self.init(handle: unsafeBitCast(handle, UnsafeMutablePointer<GSimpleActionGroup>.self))
}

}
