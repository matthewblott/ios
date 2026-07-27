import HotwireNative
import UIKit

let rootURL = URL(string: "http://localhost:5173/")!

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
  var window: UIWindow?
//  static var shared: SceneDelegate!
  private let navigator = Navigator(configuration: .init(
    name: "main",
    startLocation: rootURL
  ))
  
  func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
    guard let windowScene = scene as? UIWindowScene else { return }
    
    window = UIWindow(windowScene: windowScene)
    navigator.delegate = self
    window?.rootViewController = navigator.rootViewController
    window?.makeKeyAndVisible()
    navigator.start()
  }
}

extension SceneDelegate: NavigatorDelegate {
  func handle(proposal: VisitProposal) -> ProposalResult {
//    print("🔍 URL: \(proposal.url)")
//    print("🔍 properties: \(proposal.properties)")
    return .accept
  }
}
