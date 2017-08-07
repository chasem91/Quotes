//import UIKit
//import Apollo
//
//class ViewController: UIViewController {
//  var headerView: UIView!
//  var titleLabel: UILabel!
//  var quotesFeed: UITableView!
////  var startFinishButton: UIButton!
//  
//  override func viewDidLoad() {
//    super.viewDidLoad()
//    self.title = "View Controller"
//    setupHeaderAndTitleLabel()
//    setupQuotesFeedView()
////    setupNavigationButton()
//  }
//  
////  func buttonAction(sender:UIButton!) {
////    print("Button tapped")
////    let vc = AnotherViewController()
////    self.navigationController?.pushViewController(vc, animated: true)
////  }
//  
////  func setupNavigationButton() {
////    startFinishButton = UIButton()
////    self.view.addSubview(startFinishButton)
////    startFinishButton.frame = CGRect(x: 100, y: 100, width: 100, height: 50)
////    startFinishButton.backgroundColor = UIColor.green
////    startFinishButton.setTitle("Navigate", for: .normal)
////    startFinishButton.addTarget(self, action:#selector(buttonAction), for: UIControlEvents.touchUpInside)
////    startFinishButton.translatesAutoresizingMaskIntoConstraints = false
////    startFinishButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
////    startFinishButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
////    startFinishButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
////  }
//  
//  func setupQuotesFeedView() {
//    quotesFeed = QuotesFeedTableView().view as! UITableView
//    self.view.addSubview(quotesFeed)
//    quotesFeed.translatesAutoresizingMaskIntoConstraints = false
//    quotesFeed.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
//    quotesFeed.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
//    quotesFeed.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
//    quotesFeed.topAnchor.constraint(equalTo: headerView.bottomAnchor).isActive = true
//  }
//  
//  func setupHeaderAndTitleLabel() {
//    headerView = UIView()
//    headerView.backgroundColor = .red
//    self.view.addSubview(headerView)
//    
//    titleLabel = UILabel()
//    titleLabel.text = "QUOTES"
//    titleLabel.textAlignment = .center
//    titleLabel.font = UIFont(name: titleLabel.font.fontName, size: 20)
//    headerView.addSubview(titleLabel)
//    
//    headerView.translatesAutoresizingMaskIntoConstraints = false
//    headerView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
//    headerView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
//    headerView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 1).isActive = true
//    headerView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.1).isActive = true
//    
//    titleLabel.translatesAutoresizingMaskIntoConstraints = false
//    titleLabel.centerXAnchor.constraint(equalTo: headerView.centerXAnchor).isActive = true
//    titleLabel.bottomAnchor.constraint(equalTo: headerView.bottomAnchor).isActive = true
//    titleLabel.widthAnchor.constraint(equalTo: headerView.widthAnchor, multiplier: 0.4).isActive = true
//    titleLabel.heightAnchor.constraint(equalTo: headerView.heightAnchor, multiplier: 0.5).isActive = true
//  }
//}
