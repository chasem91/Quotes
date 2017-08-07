import UIKit
import Apollo
import ContactsUI

class QuoteReviewController: UIViewController {

  var quoteContent: String?
  
  init(quote: String) {
    super.init(nibName: nil, bundle: nil)
    quoteContent = quote
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    navigationController?.isNavigationBarHidden = true
    edgesForExtendedLayout = UIRectEdge()
    extendedLayoutIncludesOpaqueBars = false
    automaticallyAdjustsScrollViewInsets = false
    
    getAllContacts()
  }

  override func loadView() {
    super.loadView()
    view.backgroundColor = .white

    let whenSection: UIView = {
      let v = UIView()
      v.addSubview(monthTextField)
      v.addSubview(dayTextField)
      v.addSubview(yearTextField)
      v.addConstraintsWithFormat("H:|[v0(68)]-10-[v1(68)]-10-[v2]|", views: monthTextField, dayTextField, yearTextField)
      v.addConstraintsWithFormat("V:|[v0]|", views: monthTextField)
      v.addConstraintsWithFormat("V:|[v0]|", views: dayTextField)
      v.addConstraintsWithFormat("V:|[v0]|", views: yearTextField)
      return v
    }()

    let formView: UIView = {
      let v = UIView()
      v.addSubview(saidLabel)
      v.addSubview(heardLabel)
      v.addSubview(whenLabel)
      v.addSubview(saidTextField)
      v.addSubview(heardTextField)
      v.addSubview(whenSection)

      v.addConstraintsWithFormat("V:|-60-[v0(40)]-20-[v1(40)]-20-[v2(40)]|", views: saidLabel, heardLabel, whenLabel)
      v.addConstraintsWithFormat("V:|-60-[v0(40)]-20-[v1(40)]-20-[v2(40)]|", views: saidTextField, heardTextField, whenSection)
      v.addConstraintsWithFormat("H:|-10-[v0(80)]-10-[v1]-10-|", views: saidLabel, saidTextField)
      v.addConstraintsWithFormat("H:|-10-[v0(80)]-10-[v1]-10-|", views: heardLabel, heardTextField)
      v.addConstraintsWithFormat("H:|-10-[v0(80)]-10-[v1]-10-|", views: whenLabel, whenSection)
      return v
    }()
    
    let headerView: UIView = {
      let v = UIView()
      v.addSubview(screenTitle)
      v.addSubview(backButton)
      v.addSubview(doneButton)
      v.addConstraintsWithFormat("H:|[v0]", views: backButton)
      v.addConstraintsWithFormat("H:[v0]|", views: doneButton)
      v.addConstraintsWithFormat("H:|[v0]|", views: screenTitle)
      v.addConstraintsWithFormat("V:|[v0]|", views: backButton)
      v.addConstraintsWithFormat("V:|[v0]|", views: screenTitle)
      v.addConstraintsWithFormat("V:|[v0]|", views: doneButton)
      return v
    }()
    
    let quoteTextView: UITextView = {
      let textView = UITextView()
      
      let attributedText = NSMutableAttributedString(
        string: quoteContent!,
        attributes: [NSFontAttributeName: UIFont.boldSystemFont(ofSize: 14)]
      )
      let paragraphStyle = NSMutableParagraphStyle()
      paragraphStyle.lineSpacing = 4
      attributedText.addAttribute(
        NSParagraphStyleAttributeName,
        value: paragraphStyle,
        range: NSMakeRange(0, attributedText.string.characters.count)
      )
      
      let attachment = NSTextAttachment()
      attachment.image = UIImage(named: "rightQuotations")
      attributedText.append(NSAttributedString(attachment: attachment))
      textView.attributedText = attributedText
      textView.backgroundColor = .clear
      textView.textColor = .red
      textView.isSelectable = false
      return textView
    }()
    
    let quoteSectionView: UIView = {
      let v = UIView()
      v.addSubview(openQuotesImageView)
      v.addSubview(quoteTextView)
      v.addConstraintsWithFormat("H:|-10-[v0]-4-[v1]-10-|", views: openQuotesImageView, quoteTextView)
      v.addConstraintsWithFormat("V:|[v0]|", views: openQuotesImageView)
      v.addConstraintsWithFormat("V:|[v0]|", views: quoteTextView)
      return v
    }()

    view.addSubview(headerView)
    view.addSubview(formView)
    view.addSubview(quoteSectionView)
    view.addConstraintsWithFormat("V:|-30-[v0]-60-[v1]-40-[v2]-100-|", views: headerView, formView, quoteSectionView)
    view.addConstraintsWithFormat("H:|-40-[v0]-40-|", views: headerView)
    view.addConstraintsWithFormat("H:|-40-[v0]-40-|", views: formView)
    view.addConstraintsWithFormat("H:|-40-[v0]-40-|", views: quoteSectionView)
    
    
    navigationItem.title = "QUOTES"
  }
  
  func getAllContacts() {
    let status = CNContactStore.authorizationStatus(for: CNEntityType.contacts) as CNAuthorizationStatus
    
    if status == CNAuthorizationStatus.denied {
      print("Denies access to contacts")
      return
    }
    let contactStore = CNContactStore()
    let keysToFetch = [
      CNContactFormatter.descriptorForRequiredKeys(for: .fullName),
      CNContactEmailAddressesKey,
      CNContactPhoneNumbersKey,
      CNContactImageDataAvailableKey,
      CNContactThumbnailImageDataKey] as [Any]
    let request = CNContactFetchRequest(keysToFetch:keysToFetch as! [CNKeyDescriptor])
    do {
      try contactStore.enumerateContacts(with: request, usingBlock: { (contact:CNContact, stop:UnsafeMutablePointer<ObjCBool>) -> Void in
        print(contact)
        for email in contact.emailAddresses {
          var dict = [String:String]()
          dict["name"] = contact.familyName + contact.givenName
          dict["email"] = email.value as String
          print(dict)
        }
      })
    } catch {
      //catch
    }
  }
  
  func handleBackPress() {
    navigationController?.popViewController(animated: true)
  }
  
  func submitQuote() {
    let hearers = heardTextField.text!.components(separatedBy: ", ")
    let hearerNumbers = (hearers.count > 1 || (hearers.count == 1 && hearers[0].characters.count > 0)) ? hearers : []
    print(hearerNumbers)
    let quoteData = QuoteData(content: quoteContent,
                              hearerPhoneNumbers: hearerNumbers,
                              sayerPhoneNumber: saidTextField.text!,
                              posterId: "1",
                              date: "\(monthTextField.text!)/\(dayTextField.text!)/\(yearTextField.text!)")
    let createQuoteMutation = CreateQuoteMutation(quote_data: quoteData)
    apollo.perform(mutation: createQuoteMutation) { (result: GraphQLResult?, error: Error?) in
      if let error = error {
        print(#function, "ERROR | An error occured while adding the new Pokemon: \(error)")
        return
      }
      guard let newQuote = result?.data?.createQuote else {
        print(#function, "ERROR | Could not get the new quote")
        return
      }
      print("Created new quote: \(newQuote)")
      let feed = self.tabBarController?.viewControllers?[0] as! QuotesFeedController
      feed.userQueryWatcher?.refetch()
      self.tabBarController?.selectedIndex = 0
      self.navigationController?.popViewController(animated: false)
    }
  }
  
  let screenTitle: TextViewFixed = {
    let tv = TextViewFixed()
    tv.accessibilityIdentifier = "screenTitle"
    tv.textColor = .red
    tv.backgroundColor = .clear
    tv.textAlignment = .center
    tv.isSelectable = false
    tv.font = UIFont.systemFont(ofSize: 24, weight: 20)
    tv.text = "REVIEW"
    return tv
  }()
  
  let doneButton: UIButton = {
    let button = UIButton()
    button.addTarget(self, action: #selector(submitQuote), for: .touchUpInside)
    button.setTitleColor(UIColor.red, for: UIControlState.normal)
    button.setTitleColor(UIColor.black, for: UIControlState.highlighted)
    button.setTitle("Done", for: .normal)
    return button
  }()
  
  let backButton: UIButton = {
    let button = UIButton()
    button.addTarget(self, action: #selector(handleBackPress), for: .touchUpInside)
    button.setTitleColor(UIColor.red, for: UIControlState.normal)
    button.setTitleColor(UIColor.black, for: UIControlState.highlighted)
    button.setTitle("Back", for: .normal)
    return button
  }()

  let saidTextField: UITextField = {
    let tf = UITextField()
    tf.backgroundColor = .clear
    tf.layer.borderWidth = 2
    tf.layer.borderColor = UIColor.red.cgColor
    return tf
  }()

  let heardTextField: UITextField = {
    let tf = UITextField()
    tf.backgroundColor = .clear
    tf.layer.borderWidth = 2
    tf.layer.borderColor = UIColor.red.cgColor
    return tf
  }()

  let monthTextField: UITextField = {
    let tf = UITextField()
    tf.placeholder = "MM"
    tf.backgroundColor = .clear
    tf.layer.borderWidth = 2
    tf.textAlignment = .center
    tf.layer.borderColor = UIColor.red.cgColor
    return tf
  }()

  let dayTextField: UITextField = {
    let tf = UITextField()
    tf.placeholder = "DD"
    tf.backgroundColor = .clear
    tf.layer.borderWidth = 2
    tf.textAlignment = .center
    tf.layer.borderColor = UIColor.red.cgColor
    return tf
  }()

  let yearTextField: UITextField = {
    let tf = UITextField()
    tf.placeholder = "YYYY"
    tf.backgroundColor = .clear
    tf.layer.borderWidth = 2
    tf.textAlignment = .center
    tf.layer.borderColor = UIColor.red.cgColor
    return tf
  }()

  let saidLabel: UILabel = {
    let label = UILabel()
    label.text = "SAID"
    label.textColor = .red
    return label
  }()

  let heardLabel: UILabel = {
    let label = UILabel()
    label.text = "HEARD"
    label.textColor = .red
    return label
  }()

  let whenLabel: UILabel = {
    let label = UILabel()
    label.text = "WHEN"
    label.textColor = .red
    return label
  }()

  let openQuotesImageView: UIImageView = {
    let imageView = UIImageView(image: UIImage(named: "leftQuotations"))
    imageView.contentMode = .topRight
    return imageView
  }()

}
