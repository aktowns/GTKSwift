# GTKSwift

Some experimental GTK bindings for swift on linux.

![https://i.imgur.com/LDAiW6h.png?1](https://i.imgur.com/LDAiW6h.png?1)

```swift
import GTKSwift
import CGTK3

func onClicked(btn: Button) {
  print("button pressed!")

  btn.parentWindow?.destroy()
}

func onActivate(app: Application) {
  let window = Window(forApplication: app)
  window.title = "GTKSwiftDemo"
  window.size = (200, 200)

  let buttonBox = ButtonBox(withOrientation: GTK_ORIENTATION_HORIZONTAL)
  window.add(buttonBox)

  let button = Button(withLabel: "Hello World")
  button.clicked.call(onClicked)
  buttonBox.add(button)

  window.showAll()
}

let app = Application(withName: "org.ashleytowns.gtkswiftdemo")
app.activate.call(onActivate)
app.run()
```
