import CGTK3
import CGTK3.CGObject
import CGTK3.CGlib2
import CGTK3.CAtk
import CGTK3.CGdk
import CGTK3.CGio

public class Label {
  

  public typealias RawHandle = UnsafeMutablePointer<GtkLabel>
  public let handle: RawHandle

  public init(handle: RawHandle) {
    assert(handle != nil, "Label handed a nil handle")
    self.handle = handle

    let type = gtk_label_get_type()
    let inst = unsafeBitCast(handle, UnsafeMutablePointer<GTypeInstance>.self)
    assert(inst.memory.g_class != nil, "g_class for Label was nil")
    if inst.memory.g_class.memory.g_type != type {
      if g_type_check_instance_is_a(inst, type) == 0 {
        fatalError("g_class != Label type")
      }
    }
  }

        public convenience init( str: String) {
  
  let handle = gtk_label_new(str)

  self.init(handle: unsafeBitCast(handle, UnsafeMutablePointer<GtkLabel>.self))
}
 public convenience init(newWithMnemonic str: String) {
  
  let handle = gtk_label_new_with_mnemonic(str)

  self.init(handle: unsafeBitCast(handle, UnsafeMutablePointer<GtkLabel>.self))
}

}
