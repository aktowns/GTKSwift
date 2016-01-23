import CGTK3
import CGTK3.CGObject
import CGTK3.CGlib2
import CGTK3.CAtk
import CGTK3.CGdk
import CGTK3.CGio

public class Plug {
  

  public typealias RawHandle = UnsafeMutablePointer<AtkPlug>
  public let handle: RawHandle

  public init(handle: RawHandle) {
    assert(handle != nil, "Plug handed a nil handle")
    self.handle = handle

    let type = atk_plug_get_type()
    let inst = unsafeBitCast(handle, UnsafeMutablePointer<GTypeInstance>.self)
    assert(inst.memory.g_class != nil, "g_class for Plug was nil")
    if inst.memory.g_class.memory.g_type != type {
      if g_type_check_instance_is_a(inst, type) == 0 {
        fatalError("g_class != Plug type")
      }
    }
  }

        public convenience init( ) {
  
  let handle = atk_plug_new()

  self.init(handle: unsafeBitCast(handle, UnsafeMutablePointer<AtkPlug>.self))
}

}
