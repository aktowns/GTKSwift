import CGTK3
import CGTK3.CGObject
import CGTK3.CGlib2
import CGTK3.CAtk
import CGTK3.CGdk
import CGTK3.CGio

public class EntryCompletion {
  

  public typealias RawHandle = UnsafeMutablePointer<GtkEntryCompletion>
  public let handle: RawHandle

  public init(handle: RawHandle) {
    assert(handle != nil, "EntryCompletion handed a nil handle")
    self.handle = handle

    let type = gtk_entry_completion_get_type()
    let inst = unsafeBitCast(handle, UnsafeMutablePointer<GTypeInstance>.self)
    assert(inst.memory.g_class != nil, "g_class for EntryCompletion was nil")
    if inst.memory.g_class.memory.g_type != type {
      if g_type_check_instance_is_a(inst, type) == 0 {
        fatalError("g_class != EntryCompletion type")
      }
    }
  }

        public convenience init( ) {
  
  let handle = gtk_entry_completion_new()

  self.init(handle: unsafeBitCast(handle, UnsafeMutablePointer<GtkEntryCompletion>.self))
}
 public convenience init(newWithArea area: UnsafeMutablePointer<GtkCellArea>) {
  
  let handle = gtk_entry_completion_new_with_area(area)

  self.init(handle: unsafeBitCast(handle, UnsafeMutablePointer<GtkEntryCompletion>.self))
}

}
