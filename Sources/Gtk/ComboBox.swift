import CGTK3
import CGTK3.CGObject
import CGTK3.CGlib2
import CGTK3.CAtk
import CGTK3.CGdk
import CGTK3.CGio

public class ComboBox {
  

  public typealias RawHandle = UnsafeMutablePointer<GtkComboBox>
  public let handle: RawHandle

  public init(handle: RawHandle) {
    assert(handle != nil, "ComboBox handed a nil handle")
    self.handle = handle

    let type = gtk_combo_box_get_type()
    let inst = unsafeBitCast(handle, UnsafeMutablePointer<GTypeInstance>.self)
    assert(inst.memory.g_class != nil, "g_class for ComboBox was nil")
    if inst.memory.g_class.memory.g_type != type {
      if g_type_check_instance_is_a(inst, type) == 0 {
        fatalError("g_class != ComboBox type")
      }
    }
  }

        public convenience init( ) {
  
  let handle = gtk_combo_box_new()

  self.init(handle: unsafeBitCast(handle, UnsafeMutablePointer<GtkComboBox>.self))
}
 public convenience init(newWithArea area: UnsafeMutablePointer<GtkCellArea>) {
  
  let handle = gtk_combo_box_new_with_area(area)

  self.init(handle: unsafeBitCast(handle, UnsafeMutablePointer<GtkComboBox>.self))
}
 public convenience init(newWithAreaAndEntry area: UnsafeMutablePointer<GtkCellArea>) {
  
  let handle = gtk_combo_box_new_with_area_and_entry(area)

  self.init(handle: unsafeBitCast(handle, UnsafeMutablePointer<GtkComboBox>.self))
}
 public convenience init(newWithModel model: GtkTreeModel) {
  
  let handle = gtk_combo_box_new_with_model(model)

  self.init(handle: unsafeBitCast(handle, UnsafeMutablePointer<GtkComboBox>.self))
}
 public convenience init(newWithModelAndEntry model: GtkTreeModel) {
  
  let handle = gtk_combo_box_new_with_model_and_entry(model)

  self.init(handle: unsafeBitCast(handle, UnsafeMutablePointer<GtkComboBox>.self))
}

}
