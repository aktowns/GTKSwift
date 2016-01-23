import CGTK3
import CGTK3.CGObject
import CGTK3.CGlib2
import CGTK3.CAtk
import CGTK3.CGdk
import CGTK3.CGio

public class ListBox {
  

  public typealias RawHandle = UnsafeMutablePointer<GtkListBox>
  public let handle: RawHandle

  public init(handle: RawHandle) {
    assert(handle != nil, "ListBox handed a nil handle")
    self.handle = handle

    let type = gtk_list_box_get_type()
    let inst = unsafeBitCast(handle, UnsafeMutablePointer<GTypeInstance>.self)
    assert(inst.memory.g_class != nil, "g_class for ListBox was nil")
    if inst.memory.g_class.memory.g_type != type {
      if g_type_check_instance_is_a(inst, type) == 0 {
        fatalError("g_class != ListBox type")
      }
    }
  }

        public convenience init( ) {
  
  let handle = gtk_list_box_new()

  self.init(handle: unsafeBitCast(handle, UnsafeMutablePointer<GtkListBox>.self))
}

}
