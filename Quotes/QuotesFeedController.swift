import UIKit
import Apollo

let cellId = "cellId"

class QuotesFeedController: UITableViewController {
  var userQueryWatcher: GraphQLQueryWatcher<UserQuery>?
  var userId: GraphQLID?
  var postedQuotes: [QuoteDetails]? = []
  var heardQuotes: [QuoteDetails]? = []
  var saidQuotes: [QuoteDetails]? = []
  var feedQuotes: [QuoteDetails]? = [] {
    didSet {
      tableView?.reloadData()
    }
  }
  
  func fetchUser() {
    let userQuery = UserQuery(id: "1")
    userQueryWatcher = apollo.watch(query: userQuery) {
      (result: GraphQLResult?, error: Error?) in
      if let error = error {
        print(#function, "ERROR | An error occured: \(error)")
        return
      }
      guard let user = result?.data?.user else {
        print(#function, "ERROR | Could not retrieve user")
        return
      }
      self.setUserData(user: user)
    }
  }
  
  func setUserData(user: UserQuery.Data.User) {
    self.userId = user.id
    self.postedQuotes = user.postedQuotes?.map { ($0?.fragments.quoteDetails)! }
    self.saidQuotes = user.saidQuotes?.map { ($0?.fragments.quoteDetails)! }
    self.heardQuotes = user.heardQuotes?.map { ($0?.fragments.quoteDetails)! }
    self.feedQuotes = self.saidQuotes! + self.heardQuotes!
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    fetchUser()
    tableView?.alwaysBounceVertical = true
    tableView?.backgroundColor = UIColor(white: 0.95, alpha: 1)
    tableView?.register(FeedCell.self, forCellReuseIdentifier: cellId)
    edgesForExtendedLayout = UIRectEdge()
    extendedLayoutIncludesOpaqueBars = false
    automaticallyAdjustsScrollViewInsets = false
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return feedQuotes!.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let feedCell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! FeedCell
    feedCell.quote = feedQuotes![indexPath.item]
    feedCell.feedController = self
    feedCell.isUserInteractionEnabled = false
    feedCell.separatorInset = .zero
    return feedCell
  }
  
  override func viewWillAppear(_ animated: Bool) {
    tableView.estimatedRowHeight = 50.0
    tableView.rowHeight = UITableViewAutomaticDimension
  }

}

extension UIColor {
  static func rgb(_ red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
    return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1)
  }
}

extension UIView {
  func addConstraintsWithFormat(_ format: String, views: UIView...) {
    var viewsDictionary = [String: UIView]()
    for (index, view) in views.enumerated() {
      let key = "v\(index)"
      viewsDictionary[key] = view
      view.translatesAutoresizingMaskIntoConstraints = false
    }
    addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format,
                                                  options: NSLayoutFormatOptions(),
                                                  metrics: nil,
                                                  views: viewsDictionary))
  }
}
