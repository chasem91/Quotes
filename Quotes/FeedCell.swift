import UIKit
import Alamofire
import AlamofireImage

class FeedCell: UITableViewCell {
  
  var feedController: QuotesFeedController?
  
  var quote: QuoteDetails? {
    didSet {
      if let content = quote?.content {
        let attributedText = NSMutableAttributedString(string: content)
        let attachment = NSTextAttachment()
        attachment.image = UIImage(named: "rightQuotations")
        let closeQuotesAttachment = NSMutableAttributedString(attributedString: NSAttributedString(attachment: attachment))
        closeQuotesAttachment.addAttribute(NSBaselineOffsetAttributeName, value: -2, range: NSMakeRange(0, closeQuotesAttachment.string.characters.count))
        attributedText.append(closeQuotesAttachment)
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 4
        attributedText.addAttribute(
          NSParagraphStyleAttributeName,
          value: paragraphStyle,
          range: NSMakeRange(0, attributedText.string.characters.count)
        )
        
        quoteContentTextView.attributedText = attributedText
      }
      if let profilePicUrl = quote?.sayer?.profilePicUrl {
        Alamofire.request(profilePicUrl).responseImage { response in
          if let image = response.result.value {
            self.profileImageView.image = image
            self.profileImageView.layer.cornerRadius = self.profileImageView.bounds.size.width / 2
          }
        }
      }
      if let date = quote?.date {
        let index = date.index(date.startIndex, offsetBy: 10)
        quoteDateTextView.text = date.substring(to: index)
      }
      if let sayerFirstName = quote?.sayer?.firstName, let sayerLastName = quote?.sayer?.lastName {
        sayerNameLabel.text = sayerFirstName + " " + sayerLastName
      }
      if let hearers = quote?.hearers {
        let attributedText = NSMutableAttributedString(string: "Heard by: ",
                                  attributes: [NSFontAttributeName: UIFont.boldSystemFont(ofSize: 14)])
        for (index, hearer) in hearers.enumerated() {
          if let firstName = hearer?.firstName, let lastName = hearer?.lastName {
            let hearerFullName = firstName + " " + lastName
            attributedText.append(NSAttributedString(string: hearerFullName))
            if (index < hearers.count - 1) {
              attributedText.append(NSAttributedString(string: ", "))
            }
          }
        }
        heardByLabel.attributedText = attributedText
      }
    }
  }
  
  func handleNameSelect(tap: UITapGestureRecognizer) {
    print(tap)
  }
  
  override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    setupViews()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  let quoteContentTextView: UITextView = {
    let textView = UITextView()
//    textView.font = UIFont.systemFont(ofSize: 14)
//    textView.contentOffset = CGPoint(x: 0, y: -30)
    textView.contentInset.top = -10
    textView.contentInset.left = -6
    textView.backgroundColor = .clear
    textView.isScrollEnabled = false
    textView.isEditable = false
    return textView
  }()
  
  let openQuotesImageView: UIImageView = {
    let imageView = UIImageView(image: UIImage(named: "leftQuotations"))
    imageView.accessibilityIdentifier = "openQuotesImageView"
    imageView.contentMode = .topRight
    return imageView
  }()
  
  let closeQuotesImageView: UIImageView = {
    let imageView = UIImageView(image: UIImage(named: "rightQuotations"))
    imageView.accessibilityIdentifier = "closeQuotesImageView"
    imageView.contentMode = .topLeft
    return imageView
  }()
  
  let profileImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.accessibilityIdentifier = "profileImageView"
    imageView.clipsToBounds = true
    return imageView
  }()
  
  let quoteDateTextView: TextViewFixed = {
    let tv = TextViewFixed()
    tv.accessibilityIdentifier = "quoteDateTextView"
    tv.font = UIFont.boldSystemFont(ofSize: 16)
    tv.textColor = UIColor.lightGray
    return tv
  }()
  
  let sayerNameLabel: TextViewFixed = {
    let tv = TextViewFixed()
    tv.accessibilityIdentifier = "sayerNameLabel"
    tv.font = UIFont.boldSystemFont(ofSize: 16)
    return tv
  }()
  
  let heardByLabel: UILabel = {
    let label = UILabel()
    label.accessibilityIdentifier = "heardByLabel"
    return label
  }()
  
  override func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
    print(touch.view!)
    print(gestureRecognizer.view!)
    return touch.view == gestureRecognizer.view
  }
  
  func setupViews() {
    backgroundColor = .white
    
    let nameAndDateSection: UIView = {
      let v = UIView()
      v.accessibilityIdentifier = "nameAndDateSection"
      v.addSubview(sayerNameLabel)
      v.addSubview(quoteDateTextView)
      v.addConstraintsWithFormat("H:|[v0]-4-[v1(100)]|", views: sayerNameLabel, quoteDateTextView)
      v.addConstraintsWithFormat("V:|[v0]|", views: sayerNameLabel)
      v.addConstraintsWithFormat("V:|[v0]|", views: quoteDateTextView)
      return v
    }()
    
    let quoteTextAndHearersSection: UIView = {
      let v = UIView()
      v.accessibilityIdentifier = "quoteTextAndHearersSection"
      v.addSubview(quoteContentTextView)
      v.addSubview(heardByLabel)
      
      v.addConstraintsWithFormat("V:|[v0]-4-[v1]|", views: quoteContentTextView, heardByLabel)
      v.addConstraintsWithFormat("H:|[v0]|", views: quoteContentTextView)
      v.addConstraintsWithFormat("H:|[v0]|", views: heardByLabel)
      return v
    }()
    
    let quoteIconAndTextSection: UIView = {
      let v = UIView()
      v.accessibilityIdentifier = "quoteIconAndTextSection"
      v.addSubview(openQuotesImageView)
      v.addSubview(quoteTextAndHearersSection)
      v.addConstraintsWithFormat("H:|[v0(20)]-4-[v1]|", views: openQuotesImageView, quoteTextAndHearersSection)
      v.addConstraintsWithFormat("V:|[v0]|", views: openQuotesImageView)
      v.addConstraintsWithFormat("V:|[v0]|", views: quoteTextAndHearersSection)
      return v
    }()
    
    let quoteDetailsSection: UIView = {
      let v = UIView()
      v.accessibilityIdentifier = "quoteDetailsSection"
      v.addSubview(nameAndDateSection)
      v.addSubview(quoteIconAndTextSection)
      v.addConstraintsWithFormat("V:|[v0(20)]-4-[v1]|", views: nameAndDateSection, quoteIconAndTextSection)
      v.addConstraintsWithFormat("H:|[v0]|", views: nameAndDateSection)
      v.addConstraintsWithFormat("H:|[v0]|", views: quoteIconAndTextSection)
      return v
    }()

    let innerContentView: UIView = {
      let v = UIView()
      v.accessibilityIdentifier = "innerContentView"
      v.addSubview(profileImageView)
      v.addSubview(quoteDetailsSection)
      v.addConstraintsWithFormat("H:|[v0(40)]-8-[v1]|", views: profileImageView, quoteDetailsSection)
      v.addConstraintsWithFormat("V:|[v0(40)]", views: profileImageView)
      v.addConstraintsWithFormat("V:|[v0]|", views: quoteDetailsSection)
      return v
    }()
    
    contentView.addSubview(innerContentView)
    let margin = 20
    contentView.addConstraintsWithFormat("V:|-\(margin)-[v0]-\(margin)-|", views: innerContentView)
    contentView.addConstraintsWithFormat("H:|-\(margin)-[v0]-\(margin)-|", views: innerContentView)
    
  }
}

class TextViewFixed: UITextView {
  override func layoutSubviews() {
    super.layoutSubviews()
    setup()
  }
  
  func setup() {
    textContainerInset = UIEdgeInsets.zero
    textContainer.lineFragmentPadding = 0
  }
}


