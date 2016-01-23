import CGTK3
import CGTK3.CGObject
import CGTK3.CGlib2
import CGTK3.CAtk
import CGTK3.CGdk
import CGTK3.CGio

public class ColorSelectionDialog {
  

  public typealias RawHandle = UnsafeMutablePointer<GtkColorSelectionDialog>
  public let handle: RawHandle

  public init(handle: RawHandle) {
    assert(handle != nil, "ColorSelectionDialog handed a nil handle")
    self.handle = handle

    let type = gtk_color_selection_dialog_get_type()
    let inst = unsafeBitCast(handle, UnsafeMutablePointer<GTypeInstance>.self)
    assert(inst.memory.g_class != nil, "g_class for ColorSelectionDialog was nil")
    if inst.memory.g_class.memory.g_type != type {
      if g_type_check_instance_is_a(inst, type) == 0 {
        fatalError("g_class != ColorSelectionDialog type")
      }
    }
  }

        public convenience init( title: String) {
  
  let handle = gtk_color_selection_dialog_new(title)

  self.init(handle: unsafeBitCast(handle, UnsafeMutablePointer<GtkColorSelectionDialog>.self))
}

}
