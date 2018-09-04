import HtmlKituraSupport
import Kitura

let router = Router()

router.get("/") { request, response, next in
  response.send(
    html([
      head([
        style("""
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
""")
        ]),
      body([
        h1(["swift-html"]),
        blockquote(["""
A Swift DSL for constructing and rendering HTML documents.
"""
          ]),
        p(["""
This library provides a deep embedding of an HTML tree structure into the Swift programming language.
"""
          ])
        ])
      ])
  )
  next()
}

Kitura.addHTTPServer(onPort: 8080, with: router)
Kitura.run()
