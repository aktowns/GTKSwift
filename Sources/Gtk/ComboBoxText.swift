import CGTK3
import CGTK3.CGObject
import CGTK3.CGlib2
import CGTK3.CAtk
import CGTK3.CGdk
import CGTK3.CGio

public class ComboBoxText {
  

  public typealias RawHandle = UnsafeMutablePointer<GtkComboBoxText>
  public let handle: RawHandle

  public init(handle: RawHandle) {
    assert(handle != nil, "ComboBoxText handed a nil handle")
    self.handle = handle

    let type = gtk_combo_box_text_get_type()
    let inst = unsafeBitCast(handle, UnsafeMutablePointer<GTypeInstance>.self)
    assert(inst.memory.g_class != nil, "g_class for ComboBoxText was nil")
    if inst.memory.g_class.memory.g_type != type {
      if g_type_check_instance_is_a(inst, type) == 0 {
        fatalError("g_class != ComboBoxText type")
      }
    }
  }

        public convenience init( ) {
  
  let handle = gtk_combo_box_text_new()

  self.init(handle: unsafeBitCast(handle, UnsafeMutablePointer<GtkComboBoxText>.self))
}

}
