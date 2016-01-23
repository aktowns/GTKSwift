import PackageDescription

let package = Package(
  name: "GTKSwift",
  dependencies: [
    .Package(url: "https://github.com/aktowns/CGTK3.git", Version(1,0,0))
  ],
  targets: [
    Target(
      name: "GTKSwift",
      dependencies: [
          .Target(name: "Atk"),
          .Target(name: "Gdk"),
          .Target(name: "Gio"),
          .Target(name: "GObject"),
          .Target(name: "Gtk")
      ]
    ),
    Target(
      name: "GTKSwiftDemo",
      dependencies: [.Target(name: "GTKSwift")])
  ])
