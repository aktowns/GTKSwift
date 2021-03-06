//
//   Signal.swift created on 22/01/16
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

public final class FunWrapper<Target> {
  let wrapped: (Target) -> ()

  init(_ wrapped: (Target) -> ()) {
    self.wrapped = wrapped
  }

  deinit {
    print("deinitializing \(self.dynamicType)")
  }
}

public final class Signal<Target> {
  let ptr: UnsafeMutablePointer<Void>
  let type: String
  let solution: GCallback

  private var callbacks: [FunWrapper<Target>]

  public init(_ target: UnsafeMutablePointer<Void>, _ type: String, _ solution: GCallback) {
    self.ptr = target
    self.type = type
    self.solution = solution

    self.callbacks = []
  }

  public func call(cb: (Target) -> ()) {
    let wrappedCb = FunWrapper(cb)
    callbacks.append(wrappedCb)

    let callbackPtr = unsafeBitCast(wrappedCb, UnsafeMutablePointer<Void>.self)

    g_signal_connect_data(self.ptr, self.type, solution, callbackPtr, nil, GConnectFlags(0))
  }

  deinit {
    print("deinitializing \(self.dynamicType)")
  }
}
