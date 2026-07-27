import HotwireNative
import UIKit

let rootURL = URL(string: "http://localhost:5173/")!

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
  var window: UIWindow?
 
  private let navigator = Navigator(configuration: .init(
    name: "main",
    startLocation: rootURL
  ))
  
  func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
    navigator.delegate = self
    window?.rootViewController = navigator.rootViewController
    navigator.start()
  }
}

extension SceneDelegate: NavigatorDelegate {
  func handle(proposal: VisitProposal) -> ProposalResult {
    print("🔍 URL: \(proposal.url)")
    print("🔍 properties: \(proposal.properties)")
    return .accept
  }
}
