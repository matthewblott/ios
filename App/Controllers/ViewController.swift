import HotwireNative
import UIKit

class ViewController: HotwireWebViewController {
  override func viewDidLoad() {
    super.viewDidLoad()
    
    let location = self.bridgeDelegate.location
    
    if(location.contains("privacy") || location.contains("terms")) {
      self.navigationItem.hidesBackButton = false
      return
    }
    
    let properties = Hotwire.config.pathConfiguration.properties(for: currentVisitableURL)
    let hideBack = properties["hide_back_button"] as? Bool ?? true
    
    self.navigationItem.hidesBackButton = hideBack
  }
}
