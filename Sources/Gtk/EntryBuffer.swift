import CGTK3
import CGTK3.CGObject
import CGTK3.CGlib2
import CGTK3.CAtk
import CGTK3.CGdk
import CGTK3.CGio

public class EntryBuffer {
  

  public typealias RawHandle = UnsafeMutablePointer<GtkEntryBuffer>
  public let handle: RawHandle

  public init(handle: RawHandle) {
    assert(handle != nil, "EntryBuffer handed a nil handle")
    self.handle = handle

    let type = gtk_entry_buffer_get_type()
    let inst = unsafeBitCast(handle, UnsafeMutablePointer<GTypeInstance>.self)
    assert(inst.memory.g_class != nil, "g_class for EntryBuffer was nil")
    if inst.memory.g_class.memory.g_type != type {
      if g_type_check_instance_is_a(inst, type) == 0 {
        fatalError("g_class != EntryBuffer type")
      }
    }
  }

        public convenience init( initialChars: String, nInitialChars: Int32) {
  
  let handle = gtk_entry_buffer_new(initialChars, nInitialChars)

  self.init(handle: unsafeBitCast(handle, UnsafeMutablePointer<GtkEntryBuffer>.self))
}

}
