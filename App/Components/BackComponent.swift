import HotwireNative
import UIKit
import BridgeComponents

public final class BackComponent: BridgeComponent {
  override public nonisolated class var name: String { "back" }
  override public func onReceive(message: Message) {
    guard let event = Event(rawValue: message.event) else { return }
    
    switch event {
    case .left, .right:
      addButton(via: message, side: event)
    case .disconnect:
      removeButton()
    }
  }
  
  private func addButton(via message: Message, side: Event) {
    guard let data: MessageData = message.data() else { return }
    
    let image = UIImage(systemName: data.image ?? "")
    let action = UIAction { [weak self] _ in
      self?.reply(to: message.event)
    }
    
    let item = UIBarButtonItem(title: data.title, image: image, primaryAction: action)
    item.tintColor = Bridgework.color("Button", hex: data.colorCode)
    let viewController = delegate?.destination as? UIViewController
    
    switch side {
    case .left:
      var config = UIButton.Configuration.plain()
      config.image = UIImage(systemName: "chevron.backward")
      config.title = data.title
      config.imagePadding = 4
      config.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: -12, bottom: 0, trailing: 0)
    
      let button = UIButton(configuration: config, primaryAction: action)
      let backButton2 = UIBarButtonItem(customView: button)
      let spacer = UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: nil, action: nil)
      viewController?.navigationItem.leftBarButtonItems = [spacer, backButton2]
    case .right:
      viewController?.navigationItem.rightBarButtonItem = item
    default:
      return
    }
  }
  
  private func removeButton() {
    let viewController = delegate?.destination as? UIViewController
    guard let navItem = viewController?.navigationItem else { return }
    navItem.leftBarButtonItem = nil
    navItem.rightBarButtonItem = nil
  }
}

private extension BackComponent {
  enum Event: String {
    case left
    case right
    case disconnect
  }
}

private extension BackComponent {
  struct MessageData: Decodable {
    let title: String
    let image: String?
    let colorCode: String?
    
    enum CodingKeys: String, CodingKey {
      case title
      case image = "iosImage"
      case colorCode = "color"
    }
  }
}
