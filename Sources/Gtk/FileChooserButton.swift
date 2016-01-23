import CGTK3
import CGTK3.CGObject
import CGTK3.CGlib2
import CGTK3.CAtk
import CGTK3.CGdk
import CGTK3.CGio

public class FileChooserButton {
  

  public typealias RawHandle = UnsafeMutablePointer<GtkFileChooserButton>
  public let handle: RawHandle

  public init(handle: RawHandle) {
    assert(handle != nil, "FileChooserButton handed a nil handle")
    self.handle = handle

    let type = gtk_file_chooser_button_get_type()
    let inst = unsafeBitCast(handle, UnsafeMutablePointer<GTypeInstance>.self)
    assert(inst.memory.g_class != nil, "g_class for FileChooserButton was nil")
    if inst.memory.g_class.memory.g_type != type {
      if g_type_check_instance_is_a(inst, type) == 0 {
        fatalError("g_class != FileChooserButton type")
      }
    }
  }

        public convenience init( title: String, action: GtkFileChooserAction) {
  
  let handle = gtk_file_chooser_button_new(title, action)

  self.init(handle: unsafeBitCast(handle, UnsafeMutablePointer<GtkFileChooserButton>.self))
}
 public convenience init(newWithDialog dialog: UnsafeMutablePointer<GtkWidget>) {
  
  let handle = gtk_file_chooser_button_new_with_dialog(dialog)

  self.init(handle: unsafeBitCast(handle, UnsafeMutablePointer<GtkFileChooserButton>.self))
}

}
