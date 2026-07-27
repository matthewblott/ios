import UIKit

class ViewController: UIViewController {
  override func viewDidLoad() {
    super.viewDidLoad()
    let label = UILabel(frame: CGRect(x: 0, y: 100, width: view.frame.width, height: 50))
    label.text = "Hello World"
    label.textAlignment = .center
    view.addSubview(label)
  }
}
