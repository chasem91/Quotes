import UIKit
import Apollo
import Alamofire
import AlamofireImage

class ProfileViewController: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    navigationController?.isNavigationBarHidden = true
    view.backgroundColor = .white
    edgesForExtendedLayout = UIRectEdge()
    extendedLayoutIncludesOpaqueBars = false
    automaticallyAdjustsScrollViewInsets = false
  }
  
  override func loadView() {
    super.loadView()
    
    addChildViewController(quotesFeedController)
    let quotesFeedTableView = quotesFeedController.tableView!
    
    firstNameTextView.text = "SAMPLE NAME"
    
    Alamofire.request("http://lorempixel.com/200/200").responseImage { response in
      print(response)
      if let image = response.result.value {
        self.profilePictureView.image = image
        self.profilePictureView.layer.cornerRadius = self.profilePictureView.bounds.size.width / 2
      }
    }
    
    let picContainerView: UIView = {
      let v = UIView()
      let lv = UIView()
      let rv = UIView()
      v.addSubview(profilePictureView)
      v.addSubview(lv)
      v.addSubview(rv)
      v.addConstraintsWithFormat("V:|[v0(120)]|", views: profilePictureView)
      v.addConstraintsWithFormat("V:|[v0]|", views: lv)
      v.addConstraintsWithFormat("V:|[v0]|", views: rv)
      
      let width = (UIScreen.main.bounds.width - 120) / 2
      
      v.addConstraintsWithFormat("H:|[v0(\(width))][v1(120)][v2(\(width))]|", views: lv, profilePictureView, rv)
      return v
    }()
    
    let buttonSectionTopLine: UIView = {
      let v = UIView()
      v.backgroundColor = UIColor.rgb(226, green: 226, blue: 226)
      return v
    }()
    
    let heardBySaidBySection: UIView = {
      let v = UIView()
      
      let line = UIView()
      line.backgroundColor = UIColor.rgb(226, green: 226, blue: 226)
      
      v.addSubview(saidByButton)
      v.addSubview(heardByButton)
      v.addSubview(line)
      
      
      let width = UIScreen.main.bounds.width / 2 - 0.5
      v.addConstraintsWithFormat("H:|[v0(\(width))][v1(1)][v2(\(width))]|", views: saidByButton, line, heardByButton)
      v.addConstraintsWithFormat("V:|[v0]|", views: saidByButton)
      v.addConstraintsWithFormat("V:|-4-[v0]-4-|", views: line)
      v.addConstraintsWithFormat("V:|[v0]|", views: heardByButton)
      return v
    }()
    
    let buttonSectionBottomLine: UIView = {
      let v = UIView()
      v.backgroundColor = UIColor.black
      return v
    }()
    
    view.addSubview(firstNameTextView)
    view.addSubview(picContainerView)
    view.addSubview(logoutButton)
    view.addSubview(buttonSectionTopLine)
    view.addSubview(heardBySaidBySection)
    view.addSubview(buttonSectionBottomLine)
    view.addSubview(quotesFeedTableView)

    view.addConstraintsWithFormat("V:|-30-[v0(40)]-12-[v1]-24-[v2]-24-[v3(1)][v4(52)][v5(1)][v6]|",
                                  views: firstNameTextView,
                                  picContainerView,
                                  logoutButton,
                                  buttonSectionTopLine,
                                  heardBySaidBySection,
                                  buttonSectionBottomLine,
                                  quotesFeedTableView)

    view.addConstraintsWithFormat("H:|[v0]|", views: firstNameTextView)
    view.addConstraintsWithFormat("H:|[v0]|", views: picContainerView)
    view.addConstraintsWithFormat("H:|-140-[v0]-140-|", views: logoutButton)
    view.addConstraintsWithFormat("H:|[v0]|", views: buttonSectionTopLine)
    view.addConstraintsWithFormat("H:|[v0]|", views: heardBySaidBySection)
    view.addConstraintsWithFormat("H:|[v0]|", views: buttonSectionBottomLine)
    view.addConstraintsWithFormat("H:|[v0]|", views: quotesFeedTableView)
  }
  
  let quotesFeedController: QuotesFeedController = {
    let c = QuotesFeedController()
    return c
  }()
  
  let profilePictureView: UIImageView = {
    let iv = UIImageView()
    iv.clipsToBounds = true
    return iv
  }()
  
  let firstNameTextView: UILabel = {
    let label = UILabel()
    label.font = UIFont.systemFont(ofSize: 24, weight: 20)
    label.textColor = .red
    label.textAlignment = .center
    return label
  }()
  
  let logoutButton: UIButton = {
    let button = UIButton()
    button.setTitleColor(UIColor.red, for: UIControlState.normal)
    button.setTitleColor(UIColor.black, for: UIControlState.highlighted)
    let attributedString = NSAttributedString(string: "Logout",
                                              attributes: [
                                                NSFontAttributeName: UIFont.systemFont(ofSize: 16, weight: 12),
                                                NSForegroundColorAttributeName: UIColor.red
                                              ])
    
    button.setAttributedTitle(attributedString, for: .normal)
    button.backgroundColor = .clear
    button.layer.cornerRadius = 26
    button.layer.borderWidth = 1
    button.layer.borderColor = UIColor.red.cgColor
    button.contentEdgeInsets = UIEdgeInsets(top: 16, left: 10, bottom: 16, right: 10)
    button.addTarget(self, action: #selector(handleLogout), for: .touchUpInside)
    return button
  }()
  
  let saidByButton: UIButton = {
    let button = UIButton()
    button.setTitleColor(UIColor.gray, for: UIControlState.normal)
    button.setTitleColor(UIColor.black, for: UIControlState.highlighted)
    button.setTitleColor(UIColor.red, for: UIControlState.disabled)
    button.setTitle("Said By", for: .normal)
    button.addTarget(self, action: #selector(handleShowSaid), for: .touchUpInside)
    return button
  }()
  
  func handleShowSaid() {
    saidByButton.isEnabled = false
    heardByButton.isEnabled = true
    quotesFeedController.feedQuotes = quotesFeedController.saidQuotes!
  }

  let heardByButton: UIButton = {
    let button = UIButton()
    button.setTitleColor(UIColor.gray, for: UIControlState.normal)
    button.setTitleColor(UIColor.black, for: UIControlState.highlighted)
    button.setTitleColor(UIColor.red, for: UIControlState.disabled)
    button.setTitle("Heard By", for: .normal)
    button.addTarget(self, action: #selector(handleShowHeard), for: .touchUpInside)
    return button
  }()
  
  func handleShowHeard() {
    heardByButton.isEnabled = false
    saidByButton.isEnabled = true
    quotesFeedController.feedQuotes = quotesFeedController.heardQuotes!
  }
  
  func handleLogout() {
    tabBarController?.navigationController?.popViewController(animated: true)
  }
  
}
