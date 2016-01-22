//
//   window.swift created on 22/01/16
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

public final class Window : Container {
  public typealias RawHandle = UnsafeMutablePointer<GtkWindow>
  public let handle: RawHandle
  public static var memoized: [RawHandle: Window] = Dictionary<RawHandle, Window>()

  public init(handle: RawHandle) {
    self.handle = handle

    assert(handle != nil, "Window.init(handle:) handed a null handle")

    assert(Window.memoized[handle] == nil, "Window.init(handle:) initialised with tagged handler")

    Window.memoized[handle] = self
  }

  public convenience init(forApplication application: Application) {
    let handle = gtk_application_window_new(application.handle)

    self.init(handle: unsafeBitCast(handle, UnsafeMutablePointer<GtkWindow>.self))
  }

  // try UserData falling back to creating a new instance
  public static func fromHandle(handle handle: RawHandle) -> Window {
    let mptr = Window.memoized[handle]

    if let ptr = mptr {
      return ptr
    }

    return Window(handle: handle)
  }

  deinit {
    print("deinitializing \(self.dynamicType)")
  }

  public var title: String {
    get {
      return String.fromCString(gtk_window_get_title(handle)) ?? ""
    }
    set {
      gtk_window_set_title(handle, newValue)
    }
  }

  public var size: (Int32, Int32) {
    get {
      var width: Int32 = 0
      var height: Int32 = 0
      gtk_window_get_default_size(handle, &width, &height)

      return (width, height)
    }
    set {
      gtk_window_set_default_size(handle, newValue.0, newValue.1)
    }
  }
}
