import CGTK3
import CGTK3.CGObject
import CGTK3.CGlib2
import CGTK3.CAtk
import CGTK3.CGdk
import CGTK3.CGio

public class Expander {
  

  public typealias RawHandle = UnsafeMutablePointer<GtkExpander>
  public let handle: RawHandle

  public init(handle: RawHandle) {
    assert(handle != nil, "Expander handed a nil handle")
    self.handle = handle

    let type = gtk_expander_get_type()
    let inst = unsafeBitCast(handle, UnsafeMutablePointer<GTypeInstance>.self)
    assert(inst.memory.g_class != nil, "g_class for Expander was nil")
    if inst.memory.g_class.memory.g_type != type {
      if g_type_check_instance_is_a(inst, type) == 0 {
        fatalError("g_class != Expander type")
      }
    }
  }

        public convenience init( label: String) {
  
  let handle = gtk_expander_new(label)

  self.init(handle: unsafeBitCast(handle, UnsafeMutablePointer<GtkExpander>.self))
}
 public convenience init(newWithMnemonic label: String) {
  
  let handle = gtk_expander_new_with_mnemonic(label)

  self.init(handle: unsafeBitCast(handle, UnsafeMutablePointer<GtkExpander>.self))
}

}
