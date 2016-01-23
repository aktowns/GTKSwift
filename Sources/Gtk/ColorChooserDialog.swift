import CGTK3
import CGTK3.CGObject
import CGTK3.CGlib2
import CGTK3.CAtk
import CGTK3.CGdk
import CGTK3.CGio

public class ColorChooserDialog {
  

  public typealias RawHandle = UnsafeMutablePointer<GtkColorChooserDialog>
  public let handle: RawHandle

  public init(handle: RawHandle) {
    assert(handle != nil, "ColorChooserDialog handed a nil handle")
    self.handle = handle

    let type = gtk_color_chooser_dialog_get_type()
    let inst = unsafeBitCast(handle, UnsafeMutablePointer<GTypeInstance>.self)
    assert(inst.memory.g_class != nil, "g_class for ColorChooserDialog was nil")
    if inst.memory.g_class.memory.g_type != type {
      if g_type_check_instance_is_a(inst, type) == 0 {
        fatalError("g_class != ColorChooserDialog type")
      }
    }
  }

        public convenience init( title: String, parent: UnsafeMutablePointer<GtkWindow>) {
  
  let handle = gtk_color_chooser_dialog_new(title, parent)

  self.init(handle: unsafeBitCast(handle, UnsafeMutablePointer<GtkColorChooserDialog>.self))
}

}
