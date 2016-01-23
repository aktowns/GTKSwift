import CGTK3
import CGTK3.CGObject
import CGTK3.CGlib2
import CGTK3.CAtk
import CGTK3.CGdk
import CGTK3.CGio

public class ThreadedSocketService {
  

  public typealias RawHandle = UnsafeMutablePointer<GThreadedSocketService>
  public let handle: RawHandle

  public init(handle: RawHandle) {
    assert(handle != nil, "ThreadedSocketService handed a nil handle")
    self.handle = handle

    let type = g_threaded_socket_service_get_type()
    let inst = unsafeBitCast(handle, UnsafeMutablePointer<GTypeInstance>.self)
    assert(inst.memory.g_class != nil, "g_class for ThreadedSocketService was nil")
    if inst.memory.g_class.memory.g_type != type {
      if g_type_check_instance_is_a(inst, type) == 0 {
        fatalError("g_class != ThreadedSocketService type")
      }
    }
  }

        public convenience init( maxThreads: Int32) {
  
  let handle = g_threaded_socket_service_new(maxThreads)

  self.init(handle: unsafeBitCast(handle, UnsafeMutablePointer<GThreadedSocketService>.self))
}

}
