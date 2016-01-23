import CGTK3
import CGTK3.CGObject
import CGTK3.CGlib2
import CGTK3.CAtk
import CGTK3.CGdk
import CGTK3.CGio

public class TreeView {
  

  public typealias RawHandle = UnsafeMutablePointer<GtkTreeView>
  public let handle: RawHandle

  public init(handle: RawHandle) {
    assert(handle != nil, "TreeView handed a nil handle")
    self.handle = handle

    let type = gtk_tree_view_get_type()
    let inst = unsafeBitCast(handle, UnsafeMutablePointer<GTypeInstance>.self)
    assert(inst.memory.g_class != nil, "g_class for TreeView was nil")
    if inst.memory.g_class.memory.g_type != type {
      if g_type_check_instance_is_a(inst, type) == 0 {
        fatalError("g_class != TreeView type")
      }
    }
  }

        public convenience init( ) {
  
  let handle = gtk_tree_view_new()

  self.init(handle: unsafeBitCast(handle, UnsafeMutablePointer<GtkTreeView>.self))
}
 public convenience init(newWithModel model: GtkTreeModel) {
  
  let handle = gtk_tree_view_new_with_model(model)

  self.init(handle: unsafeBitCast(handle, UnsafeMutablePointer<GtkTreeView>.self))
}

}
