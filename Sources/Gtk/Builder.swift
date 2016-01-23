import CGTK3
import CGTK3.CGObject
import CGTK3.CGlib2
import CGTK3.CAtk
import CGTK3.CGdk
import CGTK3.CGio

public class Builder {
  

  public typealias RawHandle = UnsafeMutablePointer<GtkBuilder>
  public let handle: RawHandle

  public init(handle: RawHandle) {
    assert(handle != nil, "Builder handed a nil handle")
    self.handle = handle

    let type = gtk_builder_get_type()
    let inst = unsafeBitCast(handle, UnsafeMutablePointer<GTypeInstance>.self)
    assert(inst.memory.g_class != nil, "g_class for Builder was nil")
    if inst.memory.g_class.memory.g_type != type {
      if g_type_check_instance_is_a(inst, type) == 0 {
        fatalError("g_class != Builder type")
      }
    }
  }

        public convenience init( ) {
  
  let handle = gtk_builder_new()

  self.init(handle: unsafeBitCast(handle, UnsafeMutablePointer<GtkBuilder>.self))
}
 public convenience init(newFromFile filename: String) {
  
  let handle = gtk_builder_new_from_file(filename)

  self.init(handle: unsafeBitCast(handle, UnsafeMutablePointer<GtkBuilder>.self))
}
 public convenience init(newFromResource resourcePath: String) {
  
  let handle = gtk_builder_new_from_resource(resourcePath)

  self.init(handle: unsafeBitCast(handle, UnsafeMutablePointer<GtkBuilder>.self))
}
 public convenience init(newFromString string: String, length: gssize) {
  
  let handle = gtk_builder_new_from_string(string, length)

  self.init(handle: unsafeBitCast(handle, UnsafeMutablePointer<GtkBuilder>.self))
}

}
