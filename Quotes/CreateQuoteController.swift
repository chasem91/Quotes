import UIKit

class CreateQuoteController: UIViewController {
  var viewMoved: Bool = false
  
  override func viewDidLoad() {
    super.viewDidLoad()
    navigationController?.isNavigationBarHidden = true
    edgesForExtendedLayout = UIRectEdge()
    extendedLayoutIncludesOpaqueBars = false
    automaticallyAdjustsScrollViewInsets = false
    NotificationCenter.default.addObserver(self,
                                           selector: #selector(CreateQuoteController.keyboardWillShow),
                                           name: NSNotification.Name.UIKeyboardWillShow,
                                           object: nil)
    NotificationCenter.default.addObserver(self,
                                           selector: #selector(CreateQuoteController.keyboardWillHide),
                                           name: NSNotification.Name.UIKeyboardWillHide,
                                           object: nil)
  }
  
  override func loadView() {
    super.loadView()
    
    view.backgroundColor = .red
    
    let createQuoteHeader: UIView = {
      let v = UIView()
      v.accessibilityIdentifier = "createQuoteHeader"
      v.addSubview(screenTitle)
      v.addSubview(cancelButton)
      v.addConstraintsWithFormat("H:|[v0]|", views: screenTitle)
      v.addConstraintsWithFormat("H:|-20-[v0]", views: cancelButton)
      v.addConstraintsWithFormat("V:|[v0]|", views: screenTitle)
      v.addConstraintsWithFormat("V:|[v0]|", views: cancelButton)
      return v
    }()
    
    let createQuoteFooter: UIView = {
      let v = UIView()
      v.accessibilityIdentifier = "createQuoteFooter"
      v.backgroundColor = .white
      v.addSubview(remainingCharCount)
      v.addSubview(quoteButton)
      v.addConstraintsWithFormat("H:|[v0][v1]|", views: remainingCharCount, quoteButton)
      v.addConstraintsWithFormat("V:|[v0]|", views: remainingCharCount)
      v.addConstraintsWithFormat("V:|[v0]|", views: quoteButton)
      return v
    }()
    
    view.addSubview(createQuoteHeader)
    view.addSubview(quoteTextField)
    view.addSubview(createQuoteFooter)
    view.addConstraintsWithFormat("V:|-30-[v0(30)][v1][v2(40)]|", views: createQuoteHeader, quoteTextField, createQuoteFooter)
    view.addConstraintsWithFormat("H:|[v0]|", views: createQuoteHeader)
    view.addConstraintsWithFormat("H:|-20-[v0]-20-|", views: quoteTextField)
    view.addConstraintsWithFormat("H:|[v0]|", views: createQuoteFooter)
  }
  
  func keyboardWillShow(notification: NSNotification) {
    if !viewMoved {
      self.view.frame = CGRect(x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.height - 210)
      viewMoved = true
    }
  }
  
  func keyboardWillHide(notification: NSNotification) {
    if viewMoved {
      self.view.frame = CGRect(x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.height + 210)
      viewMoved = false
    }
  }
  
  func handleInput() {
    if let count = self.quoteTextField.text?.characters.count {
      let remaining = 116 - count
      remainingCharCount.text = String(remaining)
      if remaining < 0 || remaining == 116 {
        quoteButton.isEnabled = false
      } else {
        quoteButton.isEnabled = true
      }
    }
  }
  
  let quoteTextField: UITextField = {
    let tf = UITextField()
    tf.textColor = .white
    tf.backgroundColor = .clear
    tf.placeholder = "Type quote here"
    tf.addTarget(self, action: #selector(handleInput), for: .allEditingEvents)
    return tf
  }()
  
  let screenTitle: TextViewFixed = {
    let tv = TextViewFixed()
    tv.accessibilityIdentifier = "screenTitle"
    tv.textColor = .white
    tv.backgroundColor = .clear
    tv.textAlignment = .center
    tv.isSelectable = false
    tv.font = UIFont.systemFont(ofSize: 24, weight: 20)
    tv.text = "QUOTES"
    return tv
  }()
  
  let remainingCharCount: UITextView = {
    let tv = UITextView()
    tv.accessibilityIdentifier = "remainingCharCount"
    tv.textColor = .red
    tv.font = UIFont.systemFont(ofSize: 16, weight: 12)
    tv.backgroundColor = .clear
    tv.text = "116"
    return tv
  }()
  
  let cancelButton: UIButton = {
    let button = UIButton()
    button.accessibilityIdentifier = "cancelButton"
    button.setTitleColor(UIColor.white, for: UIControlState.normal)
    button.setTitleColor(UIColor.black, for: UIControlState.highlighted)
    button.setTitle("Cancel", for: .normal)
    button.addTarget(self, action: #selector(handleCancel), for: .touchUpInside)
    return button
  }()
  
  let quoteButton: UIButton = {
    let button = UIButton()
    button.setTitleColor(UIColor.red, for: UIControlState.normal)
    button.setTitleColor(UIColor.black, for: UIControlState.highlighted)
    let attributedString = NSAttributedString(string: "QUOTE IT",
                                              attributes: [
                                                NSFontAttributeName: UIFont.systemFont(ofSize: 20, weight: 12),
                                                NSForegroundColorAttributeName: UIColor.red
    ])
    button.setAttributedTitle(attributedString, for: .normal)
    button.addTarget(self, action: #selector(handleQuote), for: .touchUpInside)
    return button
  }()
  
  func handleQuote(sender: UIButton!) {
    navigationController?.pushViewController(QuoteReviewController(quote: quoteTextField.text!), animated: true)
  }
  
  func handleCancel(sender: UIButton!) {
    tabBarController?.selectedIndex = 0
  }
}
