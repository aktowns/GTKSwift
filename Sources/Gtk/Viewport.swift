import CGTK3
import CGTK3.CGObject
import CGTK3.CGlib2
import CGTK3.CAtk
import CGTK3.CGdk
import CGTK3.CGio

public class Viewport {
  

  public typealias RawHandle = UnsafeMutablePointer<GtkViewport>
  public let handle: RawHandle

  public init(handle: RawHandle) {
    assert(handle != nil, "Viewport handed a nil handle")
    self.handle = handle

    let type = gtk_viewport_get_type()
    let inst = unsafeBitCast(handle, UnsafeMutablePointer<GTypeInstance>.self)
    assert(inst.memory.g_class != nil, "g_class for Viewport was nil")
    if inst.memory.g_class.memory.g_type != type {
      if g_type_check_instance_is_a(inst, type) == 0 {
        fatalError("g_class != Viewport type")
      }
    }
  }

        public convenience init( hadjustment: UnsafeMutablePointer<GtkAdjustment>, vadjustment: UnsafeMutablePointer<GtkAdjustment>) {
  
  let handle = gtk_viewport_new(hadjustment, vadjustment)

  self.init(handle: unsafeBitCast(handle, UnsafeMutablePointer<GtkViewport>.self))
}

}
