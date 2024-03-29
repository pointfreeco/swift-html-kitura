# swift-html-kitura has been deprecated

With IBM [discontinuing its involvement](https://forums.swift.org/t/december-12th-2019/31735) in server-side Swift, we are choosing to deprecate support for this library. It will remain in an archived state as an example of how to integrate with [swift-html](https://github.com/pointfreeco/swift-html).

---

# swift-html-kitura

[![Swift 5](https://img.shields.io/badge/swift-5-ED523F.svg?style=flat)](https://swift.org/download/)
[![Linux CI](https://img.shields.io/travis/pointfreeco/swift-html-kitura/master.svg?label=linux)](https://trav is-ci.org/pointfreeco/swift-html-kitura)
[![@pointfreeco](https://img.shields.io/badge/contact-@pointfreeco-5AA9E7.svg?style=flat)](https://twitter.com/pointfreeco)

[Kitura](https://www.kitura.io) plugin for type-safe, transformable HTML views using [swift-html](https://github.com/pointfreeco/swift-html).

## Motivation

The most popular choice for rendering HTML in a Kitura web app is to use the Stencil templating language, but it exposes your application to **runtime errors** and **invalid HTML**. Our plugin prevents these runtime issues at compile-time by embedding HTML directly into Swift’s powerful type system. It uses the [swift-html](https://github.com/pointfreeco/swift-html) DSL for constructing HTML documents using plain Swift data structures.

## Usage

To use the plugin all you have to do is return a `Node` value from your router callback:

``` swift
import HtmlKituraSupport
import Kitura

let router = Router()

router.get("/") { request, response, next in
  response.send(
    Node.h1("Hello, type-safe HTML on Kitura!")
  )
  next()
}

Kitura.addHTTPServer(onPort: 8080, with: router)
Kitura.run()
```

## Take it for a spin

We've included a sample Kitura application in this repo to show off its usage. To run the app immediately, simply do:

* `swift run HtmlKituraSupportExample`
* Open your browser to `http://localhost:8080`

The HTML for that page is constructed and rendered with [swift-html](https://github.com/pointfreeco/swift-html)!

If you want to run the app in Xcode so that you can play around with the HTML, try this:

* `git clone https://github.com/pointfreeco/swift-html-kitura`
* `cd swift-html-kitura`
* `make xcodeproj`
* Select the `HtmlKituraSupportExample` target
* Build and run `cmd+R`
* Open your browser to `http://localhost:8080`

## Installation

If you want to use swift-html-kitura in a project that uses [SwiftPM](https://swift.org/package-manager/), it's as simple as adding a `dependencies` clause to your `Package.swift`:

``` swift
dependencies: [
  .package(url: "https://github.com/pointfreeco/swift-html-kitura.git", from: "0.3.0")
]
```

### Xcode Sub-project

Submodule, clone, or download swift-html-kitura, and drag `HtmlKituraSupport.xcodeproj` into your project.

## License

All modules are released under the MIT license. See [LICENSE](LICENSE) for details.
