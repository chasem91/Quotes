import UIKit
import Apollo

class SignUpDetailsController: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    navigationController?.navigationController?.isNavigationBarHidden = true
  }
  
  override func loadView() {
    super.loadView()
    view.backgroundColor = .white
    
    view.addSubview(phoneNumberTextField)
    view.addSubview(submitButton)
    view.addConstraintsWithFormat("V:|-100-[v0(30)]-10-[v1(30)]",
                                  views: phoneNumberTextField,
                                         submitButton)
    view.addConstraintsWithFormat("H:|-20-[v0]-20-|", views: phoneNumberTextField)
    view.addConstraintsWithFormat("H:|-20-[v0]-20-|", views: submitButton)
  }
  
  let phoneNumberTextField: UITextField = {
    let tf = UITextField()
    tf.placeholder = "Phone number"
    return tf
  }()
  
  func handleSubmit() {
    tabBarController?.navigationController?.pushViewController(CustomTabBarController(), animated: true)
  }
  
  let submitButton: UIButton = {
    let b = UIButton()
    b.setTitleColor(UIColor.red, for: UIControlState.normal)
    b.setTitleColor(UIColor.green, for: UIControlState.highlighted)
    b.addTarget(self, action: #selector(handleSubmit), for: .touchUpInside)
    b.setTitle("SUBMIT", for: .normal)
    return b
  }()
  
  
}
