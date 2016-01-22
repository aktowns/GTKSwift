//
//   Application.swift created on 22/01/16
//   GTKSwift project
//
//   Copyright 2016 Ashley Towns <code@ashleytowns.id.au>
//
//   Licensed under the Apache License, Version 2.0 (the "License");
//   you may not use this file except in compliance with the License.
//   You may obtain a copy of the License at
//
//       http://www.apache.org/licenses/LICENSE-2.0
//
//   Unless required by applicable law or agreed to in writing, software
//   distributed under the License is distributed on an "AS IS" BASIS,
//   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//   See the License for the specific language governing permissions and
//   limitations under the License.
//

import CGTK3

public final class Application: CHandle {
  public typealias RawHandle = UnsafeMutablePointer<GtkApplication>
  public let handle: RawHandle
  public static var memoized: [RawHandle: Application] = Dictionary<RawHandle, Application>()

  public let activate: Signal<Application>

  public init(handle: RawHandle) {
    self.handle = handle

    assert(handle != nil, "Application.init(handle:) handed a null handle")

    assert(Application.memoized[handle] == nil, "Application.init(handle:) initialised with tagged handler")

    self.activate = Signal(handle, "activate", applicationActivateCast({
      (app: UnsafeMutablePointer<GtkApplication>, userData: UnsafeMutablePointer<Void>) in

      assert(userData != nil, "Application.UserData handed null user data")
      assert(app != nil, "Application.clicked handed a null application")

      let app = Application.fromHandle(handle: app)
      let cb = unsafeBitCast(userData, FunWrapper<Application>.self)

      cb.wrapped(app)
    }))

    Application.memoized[handle] = self
  }

  public convenience init(withName name: String) {
    let handle = gtk_application_new(name, G_APPLICATION_FLAGS_NONE)

    self.init(handle: handle)
  }

  // try UserData falling back to creating a new instance
  public static func fromHandle(handle handle: RawHandle) -> Application {
    let mptr = Application.memoized[handle]

    if let ptr = mptr {
      return ptr
    }

    return Application(handle: handle)
  }

  deinit {
    print("deinitializing \(self.dynamicType)")
  }

  public func run() {
    g_application_run(unsafeBitCast(self.handle, UnsafeMutablePointer<GApplication>.self), 0, nil)
  }
}
