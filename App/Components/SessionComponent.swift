import Foundation
import UIKit
import HotwireNative

final class SessionComponent: BridgeComponent {
  override public nonisolated class var name: String { "session" }
  
  override func onReceive(message: Message) {
    guard let event = Event(rawValue: message.event) else { return }
    switch event {
    case .signOut:
      resetSession()
    }
  }
  
  private func resetSession() {
    if let cookies = HTTPCookieStorage.shared.cookies {
      for cookie in cookies {
        HTTPCookieStorage.shared.deleteCookie(cookie)
      }
    }
    
//    guard let signInURL = URL(string: "http://localhost:5173/") else { return }
//    let navigator = SceneDelegate.shared.navigator
//    navigator.route(signInURL, options: VisitOptions(action: .replace))
    
  }
}

private extension SessionComponent {
  enum Event: String {
    case signOut
  }
}
