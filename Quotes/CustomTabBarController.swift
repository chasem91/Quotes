import UIKit

class CustomTabBarController: UITabBarController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    navigationController?.isNavigationBarHidden = true
    
    let quotesFeedController = QuotesFeedController()
    quotesFeedController.tabBarItem.image = UIImage(named: "feedIcon")
    quotesFeedController.tabBarItem.imageInsets = UIEdgeInsetsMake(4, 0, -4, 0)
    
    let createQuoteController = CreateQuoteController()
    let createQuoteNavigationController = UINavigationController(rootViewController: createQuoteController)
    createQuoteNavigationController.isNavigationBarHidden = true
    createQuoteNavigationController.tabBarItem.image = UIImage(named: "quoteProcessIcon")
    createQuoteNavigationController.tabBarItem.imageInsets = UIEdgeInsetsMake(4, 0, -4, 0)
    
    let profileViewController = ProfileViewController()
    profileViewController.tabBarItem.image = UIImage(named: "profileIcon")
    profileViewController.tabBarItem.imageInsets = UIEdgeInsetsMake(4, 0, -4, 0)
    
    viewControllers = [quotesFeedController, createQuoteNavigationController, profileViewController]
    tabBar.tintColor = UIColor.red
    tabBar.barStyle = .default
    
  }
  
  override func viewWillLayoutSubviews() {
    var newTabBarFrame = tabBar.frame
    
    let newTabBarHeight: CGFloat = 60
    newTabBarFrame.size.height = newTabBarHeight
    newTabBarFrame.origin.y = self.view.frame.size.height - newTabBarHeight
    
    tabBar.frame = newTabBarFrame
  }
  
}
