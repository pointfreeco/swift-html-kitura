import HtmlKituraSupport
import Kitura

let router = Router()

let stylesheet: StaticString = """
body {
  padding: 0.5rem;
  line-height: 1.35;
  font-family: SanFranciscoDisplay-Regular;
}

blockquote {
  border-left: 2px #777 solid;
  font-style: italic;
  color: #777;
  margin-left: 1rem;
  padding-left: 0.5rem;
}

pre {
  background-color: #f3f3f3;
  padding: 0.5rem;
  overflow-x: scroll;
}

code {
  background-color: #f3f3f3;
  padding: 0.25rem;
}

li:not(:last-child) {
  margin-bottom: 0.25rem;
}

h2 {
  margin-top: 2rem;
  margin-bottom: 0;
}
"""

router.get("/") { request, response, next in
  response.send(
    Node.html(
      .head(.style(safe: stylesheet)),

      .body(
        .h1("swift-html-kitura"),
        .blockquote(
          "A Kitura plugin for type-safe, transformable HTML views using ",
          .a(attributes: [.href("https://github.com/pointfreeco/swift-html")], "swift-html")
        ),

        .h2("Motivation"),
        .p("""
The most popular choice for rendering HTML in a Kitura web app is to use the Stencil templating language,
but it exposes your application to runtime errors and invalid HTML. Our plugin prevents these
runtime issues at compile-time by embedding HTML directly into Swift’s powerful type system. It uses the
swift-html DSL for constructing HTML documents using plain Swift data structures.
"""
        ),

        .h2("Usage"),
        .p("""
To use the plugin all you have to do is return a `Node` value from your router callback:
"""
        ),
        .pre(#"""
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
"""#
        ),

        .h2("Take it for a spin"),
        .p("""
We've included a sample Kitura application in this repo to show off its usage. To run the app
immediately, simply do:
"""
        ),
        .ul(
          .li(.code("swift run HtmlKituraSupportExample")),
          .li("Open your browser to ", .code("http://localhost:8080"))
        ),
        .p("""
The HTML for that page is constructed and rendered with swift-html!
"""
        ),
        .p("""
If you want to run the app in Xcode so that you can play around with the HTML, try this:
"""
        ),
        .ul(
          .li(.code("git clone https://github.com/pointfreeco/swift-html-kitura")),
          .li(.code("cd swift-html-kitura")),
          .li(.code("make xcodeproj")),
          .li("Select the ", .code("HtmlKituraSupportExample"), " target"),
          .li("Build and run ", .code("cmd+R")),
          .li("Open your browser to ", .code("http://localhost:8080")
          )
        )
      )
    )
  )

  next()
}

Kitura.addHTTPServer(onPort: 8080, with: router)
Kitura.run()
