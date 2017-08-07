import UIKit

class SignInTabBarController: UITabBarController {
  override func viewDidLoad() {
    super.viewDidLoad()
    
    navigationController?.isNavigationBarHidden = true
    
    let signInViewController = SignInViewController()
    signInViewController.tabBarItem.title = "Sign In"
    signInViewController.tabBarItem.setTitleTextAttributes([NSFontAttributeName: UIFont.boldSystemFont(ofSize: 40)], for: .normal)
    
    let signUpViewController = SignUpViewController()
    let signUpNavigationController = UINavigationController(rootViewController: signUpViewController)
    signUpNavigationController.isNavigationBarHidden = true
    signUpNavigationController.tabBarItem.title = "Sign Up"
    signUpNavigationController.tabBarItem.setTitleTextAttributes([NSFontAttributeName: UIFont.boldSystemFont(ofSize: 40)], for: .normal)
    
    viewControllers = [signInViewController, signUpNavigationController]
    tabBar.barStyle = .default
  }
}
