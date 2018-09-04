@_exported import Html
import Kitura

extension RouterResponse {
  public func send(_ html: Html.Node) {
    self.headers.setType("html")
    self.send(Html.render(html))
  }
}
