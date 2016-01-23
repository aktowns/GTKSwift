import CGTK3
import CGTK3.CGObject
import CGTK3.CGlib2
import CGTK3.CAtk
import CGTK3.CGdk
import CGTK3.CGio

public class TlsCertificate {
  

  public typealias RawHandle = UnsafeMutablePointer<GTlsCertificate>
  public let handle: RawHandle

  public init(handle: RawHandle) {
    assert(handle != nil, "TlsCertificate handed a nil handle")
    self.handle = handle

    let type = g_tls_certificate_get_type()
    let inst = unsafeBitCast(handle, UnsafeMutablePointer<GTypeInstance>.self)
    assert(inst.memory.g_class != nil, "g_class for TlsCertificate was nil")
    if inst.memory.g_class.memory.g_type != type {
      if g_type_check_instance_is_a(inst, type) == 0 {
        fatalError("g_class != TlsCertificate type")
      }
    }
  }

        public convenience init(newFromFile file: String) {
  var err = UnsafeMutablePointer<GError>.alloc(1)
  let handle = g_tls_certificate_new_from_file(file, &err)

  self.init(handle: unsafeBitCast(handle, UnsafeMutablePointer<GTlsCertificate>.self))
}
 public convenience init(newFromFiles certFile: String, keyFile: String) {
  var err = UnsafeMutablePointer<GError>.alloc(1)
  let handle = g_tls_certificate_new_from_files(certFile, keyFile, &err)

  self.init(handle: unsafeBitCast(handle, UnsafeMutablePointer<GTlsCertificate>.self))
}
 public convenience init(newFromPem data: String, length: gssize) {
  var err = UnsafeMutablePointer<GError>.alloc(1)
  let handle = g_tls_certificate_new_from_pem(data, length, &err)

  self.init(handle: unsafeBitCast(handle, UnsafeMutablePointer<GTlsCertificate>.self))
}

}
