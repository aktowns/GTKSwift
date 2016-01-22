//
//   widget.swift created on 22/01/16
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

public protocol CHandle {
  typealias Rawhandle
  var handle: Rawhandle { get }
}

public protocol Widget: CHandle { }

public protocol Container : Widget { }

extension Widget {
  public func showAll() {
    gtk_widget_show_all(self.asWidget)
  }

  public func destroy() {
    gtk_widget_destroy(self.asWidget)
  }

  public var parentWindow: Window? {
    let ptr = gtk_widget_get_toplevel(self.asWidget)
    if gtk_widget_is_toplevel(ptr) != 0 {
      return Window.fromHandle(handle: unsafeBitCast(ptr, UnsafeMutablePointer<GtkWindow>.self))
    }
    return Optional.None
  }

  public var asWidget: UnsafeMutablePointer<GtkWidget> {
    return unsafeBitCast(self.handle, UnsafeMutablePointer<GtkWidget>.self)
  }
}

extension Container {
  public func add<T : Widget>(widget: T) {
    gtk_container_add(self.asContainer, widget.asWidget)
  }

  public var asContainer: UnsafeMutablePointer<GtkContainer> {
    return unsafeBitCast(self.handle, UnsafeMutablePointer<GtkContainer>.self)
  }
}
