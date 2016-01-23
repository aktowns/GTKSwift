import CGTK3
import CGTK3.CGObject
import CGTK3.CGlib2
import CGTK3.CAtk
import CGTK3.CGdk
import CGTK3.CGio

public class Paned {
  

  public typealias RawHandle = UnsafeMutablePointer<GtkPaned>
  public let handle: RawHandle

  public init(handle: RawHandle) {
    assert(handle != nil, "Paned handed a nil handle")
    self.handle = handle

    let type = gtk_paned_get_type()
    let inst = unsafeBitCast(handle, UnsafeMutablePointer<GTypeInstance>.self)
    assert(inst.memory.g_class != nil, "g_class for Paned was nil")
    if inst.memory.g_class.memory.g_type != type {
      if g_type_check_instance_is_a(inst, type) == 0 {
        fatalError("g_class != Paned type")
      }
    }
  }

        public convenience init( orientation: GtkOrientation) {
  
  let handle = gtk_paned_new(orientation)

  self.init(handle: unsafeBitCast(handle, UnsafeMutablePointer<GtkPaned>.self))
}

}
