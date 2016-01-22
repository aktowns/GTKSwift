//
//   Button.swift created on 22/01/16
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

public final class Button : Widget {
  public typealias RawHandle = UnsafeMutablePointer<GtkButton>
  public let handle: RawHandle

  public static var memoized: [RawHandle: Button] = Dictionary<RawHandle, Button>()

  public let clicked: Signal<Button>

  public init(handle: RawHandle) {
    self.handle = handle

    assert(handle != nil, "Button.init(handle:) handed a null handle")

    assert(Button.memoized[handle] == nil, "Button.init(handle:) initialised with tagged handler")

    self.clicked = Signal(handle, "clicked", buttonClickedCast({
      (btn: UnsafeMutablePointer<GtkButton>, userData: UnsafeMutablePointer<Void>) in

      assert(userData != nil, "Button.UserData handed null user data")
      assert(btn != nil, "Button.clicked handed a null button")

      let button = Button.fromHandle(handle: btn)
      let cb = unsafeBitCast(userData, FunWrapper<Button>.self)

      cb.wrapped(button)
    }))

    Button.memoized[handle] = self
  }

  public convenience init(withLabel label: String) {
    let handle = gtk_button_new_with_label(label)


    self.init(handle: unsafeBitCast(handle, UnsafeMutablePointer<GtkButton>.self))
  }

  public static func fromHandle(handle handle: RawHandle) -> Button {
    let mptr = Button.memoized[handle]

    if let ptr = mptr {
      return ptr
    }

    return Button(handle: handle)
  }

  deinit {
    print("deinitializing \(self.dynamicType)")
  }
}
