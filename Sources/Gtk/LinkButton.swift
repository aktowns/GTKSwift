import CGTK3
import CGTK3.CGObject
import CGTK3.CGlib2
import CGTK3.CAtk
import CGTK3.CGdk
import CGTK3.CGio

public class LinkButton {
  

  public typealias RawHandle = UnsafeMutablePointer<GtkLinkButton>
  public let handle: RawHandle

  public init(handle: RawHandle) {
    assert(handle != nil, "LinkButton handed a nil handle")
    self.handle = handle

    let type = gtk_link_button_get_type()
    let inst = unsafeBitCast(handle, UnsafeMutablePointer<GTypeInstance>.self)
    assert(inst.memory.g_class != nil, "g_class for LinkButton was nil")
    if inst.memory.g_class.memory.g_type != type {
      if g_type_check_instance_is_a(inst, type) == 0 {
        fatalError("g_class != LinkButton type")
      }
    }
  }

        public convenience init( uri: String) {
  
  let handle = gtk_link_button_new(uri)

  self.init(handle: unsafeBitCast(handle, UnsafeMutablePointer<GtkLinkButton>.self))
}
 public convenience init(newWithLabel uri: String, label: String) {
  
  let handle = gtk_link_button_new_with_label(uri, label)

  self.init(handle: unsafeBitCast(handle, UnsafeMutablePointer<GtkLinkButton>.self))
}

}
