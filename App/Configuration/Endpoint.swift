import UIKit

struct Endpoint {
  static let remote: URL? = URL(string: "https://jimlog.coderscoffeehouse.com")!
  static let local: URL? = URL(string: "http://localhost:5173")!
  
  static var baseURL: URL? {
#if DEBUG
    local
#else
    remote
#endif
  }
}
