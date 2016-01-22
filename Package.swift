import PackageDescription

let package = Package(
  name: "GTKSwift",
  dependencies: [
    .Package(url: "https://github.com/aktowns/CGTK3.git", Version(1,0,0))
  ],
  targets: [
    Target(
      name: "GTKSwiftDemo",
      dependencies: [.Target(name: "GTKSwift")])
  ])
