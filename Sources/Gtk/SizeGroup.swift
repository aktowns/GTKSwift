import CGTK3
import CGTK3.CGObject
import CGTK3.CGlib2
import CGTK3.CAtk
import CGTK3.CGdk
import CGTK3.CGio

public class SizeGroup {
  

  public typealias RawHandle = UnsafeMutablePointer<GtkSizeGroup>
  public let handle: RawHandle

  public init(handle: RawHandle) {
    assert(handle != nil, "SizeGroup handed a nil handle")
    self.handle = handle

    let type = gtk_size_group_get_type()
    let inst = unsafeBitCast(handle, UnsafeMutablePointer<GTypeInstance>.self)
    assert(inst.memory.g_class != nil, "g_class for SizeGroup was nil")
    if inst.memory.g_class.memory.g_type != type {
      if g_type_check_instance_is_a(inst, type) == 0 {
        fatalError("g_class != SizeGroup type")
      }
    }
  }

        public convenience init( mode: GtkSizeGroupMode) {
  
  let handle = gtk_size_group_new(mode)

  self.init(handle: unsafeBitCast(handle, UnsafeMutablePointer<GtkSizeGroup>.self))
}

}
