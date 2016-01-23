import CGTK3
import CGTK3.CGObject
import CGTK3.CGlib2
import CGTK3.CAtk
import CGTK3.CGdk
import CGTK3.CGio

public class AppChooserDialog {
  

  public typealias RawHandle = UnsafeMutablePointer<GtkAppChooserDialog>
  public let handle: RawHandle

  public init(handle: RawHandle) {
    assert(handle != nil, "AppChooserDialog handed a nil handle")
    self.handle = handle

    let type = gtk_app_chooser_dialog_get_type()
    let inst = unsafeBitCast(handle, UnsafeMutablePointer<GTypeInstance>.self)
    assert(inst.memory.g_class != nil, "g_class for AppChooserDialog was nil")
    if inst.memory.g_class.memory.g_type != type {
      if g_type_check_instance_is_a(inst, type) == 0 {
        fatalError("g_class != AppChooserDialog type")
      }
    }
  }

        public convenience init( parent: UnsafeMutablePointer<GtkWindow>, flags: GtkDialogFlags, file: GFile) {
  
  let handle = gtk_app_chooser_dialog_new(parent, flags, file)

  self.init(handle: unsafeBitCast(handle, UnsafeMutablePointer<GtkAppChooserDialog>.self))
}
 public convenience init(newForContentType parent: UnsafeMutablePointer<GtkWindow>, flags: GtkDialogFlags, contentType: String) {
  
  let handle = gtk_app_chooser_dialog_new_for_content_type(parent, flags, contentType)

  self.init(handle: unsafeBitCast(handle, UnsafeMutablePointer<GtkAppChooserDialog>.self))
}

}
