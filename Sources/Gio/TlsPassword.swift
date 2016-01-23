import CGTK3
import CGTK3.CGObject
import CGTK3.CGlib2
import CGTK3.CAtk
import CGTK3.CGdk
import CGTK3.CGio

public class TlsPassword {
  

  public typealias RawHandle = UnsafeMutablePointer<GTlsPassword>
  public let handle: RawHandle

  public init(handle: RawHandle) {
    assert(handle != nil, "TlsPassword handed a nil handle")
    self.handle = handle

    let type = g_tls_password_get_type()
    let inst = unsafeBitCast(handle, UnsafeMutablePointer<GTypeInstance>.self)
    assert(inst.memory.g_class != nil, "g_class for TlsPassword was nil")
    if inst.memory.g_class.memory.g_type != type {
      if g_type_check_instance_is_a(inst, type) == 0 {
        fatalError("g_class != TlsPassword type")
      }
    }
  }

        public convenience init( flags: GTlsPasswordFlags, description: String) {
  
  let handle = g_tls_password_new(flags, description)

  self.init(handle: unsafeBitCast(handle, UnsafeMutablePointer<GTlsPassword>.self))
}

}
