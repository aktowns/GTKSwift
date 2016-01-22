//
//   ButtonBox.swift created on 22/01/16
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

public final class ButtonBox : Container {
  public typealias RawHandle = UnsafeMutablePointer<GtkWidget>
  public let handle: RawHandle

  public init(handle: RawHandle) {
    self.handle = handle

    assert(handle != nil, "ButtonBox.init(handle:) handed a null handle")
  }

  public convenience init(withOrientation orientation: GtkOrientation) {
    let handle = gtk_button_box_new(orientation)

    self.init(handle: handle)
  }
}
