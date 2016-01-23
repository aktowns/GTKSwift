import CGTK3
import CGTK3.CGObject
import CGTK3.CGlib2
import CGTK3.CAtk
import CGTK3.CGdk
import CGTK3.CGio

public class TreeViewColumn {
  

  public typealias RawHandle = UnsafeMutablePointer<GtkTreeViewColumn>
  public let handle: RawHandle

  public init(handle: RawHandle) {
    assert(handle != nil, "TreeViewColumn handed a nil handle")
    self.handle = handle

    let type = gtk_tree_view_column_get_type()
    let inst = unsafeBitCast(handle, UnsafeMutablePointer<GTypeInstance>.self)
    assert(inst.memory.g_class != nil, "g_class for TreeViewColumn was nil")
    if inst.memory.g_class.memory.g_type != type {
      if g_type_check_instance_is_a(inst, type) == 0 {
        fatalError("g_class != TreeViewColumn type")
      }
    }
  }

        public convenience init( ) {
  
  let handle = gtk_tree_view_column_new()

  self.init(handle: unsafeBitCast(handle, UnsafeMutablePointer<GtkTreeViewColumn>.self))
}
 public convenience init(newWithArea area: UnsafeMutablePointer<GtkCellArea>) {
  
  let handle = gtk_tree_view_column_new_with_area(area)

  self.init(handle: unsafeBitCast(handle, UnsafeMutablePointer<GtkTreeViewColumn>.self))
}

}
