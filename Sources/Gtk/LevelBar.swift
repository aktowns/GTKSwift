import CGTK3
import CGTK3.CGObject
import CGTK3.CGlib2
import CGTK3.CAtk
import CGTK3.CGdk
import CGTK3.CGio

public class LevelBar {
  

  public typealias RawHandle = UnsafeMutablePointer<GtkLevelBar>
  public let handle: RawHandle

  public init(handle: RawHandle) {
    assert(handle != nil, "LevelBar handed a nil handle")
    self.handle = handle

    let type = gtk_level_bar_get_type()
    let inst = unsafeBitCast(handle, UnsafeMutablePointer<GTypeInstance>.self)
    assert(inst.memory.g_class != nil, "g_class for LevelBar was nil")
    if inst.memory.g_class.memory.g_type != type {
      if g_type_check_instance_is_a(inst, type) == 0 {
        fatalError("g_class != LevelBar type")
      }
    }
  }

        public convenience init( ) {
  
  let handle = gtk_level_bar_new()

  self.init(handle: unsafeBitCast(handle, UnsafeMutablePointer<GtkLevelBar>.self))
}
 public convenience init(newForInterval minValue: Double, maxValue: Double) {
  
  let handle = gtk_level_bar_new_for_interval(minValue, maxValue)

  self.init(handle: unsafeBitCast(handle, UnsafeMutablePointer<GtkLevelBar>.self))
}

}
