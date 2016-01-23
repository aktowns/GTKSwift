import CGTK3
import CGTK3.CGObject
import CGTK3.CGlib2
import CGTK3.CAtk
import CGTK3.CGdk
import CGTK3.CGio

public class Entry {
  

  public typealias RawHandle = UnsafeMutablePointer<GtkEntry>
  public let handle: RawHandle

  public init(handle: RawHandle) {
    assert(handle != nil, "Entry handed a nil handle")
    self.handle = handle

    let type = gtk_entry_get_type()
    let inst = unsafeBitCast(handle, UnsafeMutablePointer<GTypeInstance>.self)
    assert(inst.memory.g_class != nil, "g_class for Entry was nil")
    if inst.memory.g_class.memory.g_type != type {
      if g_type_check_instance_is_a(inst, type) == 0 {
        fatalError("g_class != Entry type")
      }
    }
  }

        public convenience init( ) {
  
  let handle = gtk_entry_new()

  self.init(handle: unsafeBitCast(handle, UnsafeMutablePointer<GtkEntry>.self))
}
 public convenience init(newWithBuffer buffer: UnsafeMutablePointer<GtkEntryBuffer>) {
  
  let handle = gtk_entry_new_with_buffer(buffer)

  self.init(handle: unsafeBitCast(handle, UnsafeMutablePointer<GtkEntry>.self))
}

}
