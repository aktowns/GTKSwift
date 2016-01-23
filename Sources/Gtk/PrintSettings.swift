import CGTK3
import CGTK3.CGObject
import CGTK3.CGlib2
import CGTK3.CAtk
import CGTK3.CGdk
import CGTK3.CGio

public class PrintSettings {
  

  public typealias RawHandle = GtkPrintSettings
  public let handle: RawHandle

  public init(handle: RawHandle) {
    assert(handle != nil, "PrintSettings handed a nil handle")
    self.handle = handle

    let type = gtk_print_settings_get_type()
    let inst = unsafeBitCast(handle, UnsafeMutablePointer<GTypeInstance>.self)
    assert(inst.memory.g_class != nil, "g_class for PrintSettings was nil")
    if inst.memory.g_class.memory.g_type != type {
      if g_type_check_instance_is_a(inst, type) == 0 {
        fatalError("g_class != PrintSettings type")
      }
    }
  }

        public convenience init( ) {
  
  let handle = gtk_print_settings_new()

  self.init(handle: unsafeBitCast(handle, GtkPrintSettings.self))
}
 public convenience init(newFromFile fileName: String) {
  var err = UnsafeMutablePointer<GError>.alloc(1)
  let handle = gtk_print_settings_new_from_file(fileName, &err)

  self.init(handle: unsafeBitCast(handle, GtkPrintSettings.self))
}
 public convenience init(newFromKeyFile keyFile: GKeyFile, groupName: String) {
  var err = UnsafeMutablePointer<GError>.alloc(1)
  let handle = gtk_print_settings_new_from_key_file(keyFile, groupName, &err)

  self.init(handle: unsafeBitCast(handle, GtkPrintSettings.self))
}

}
