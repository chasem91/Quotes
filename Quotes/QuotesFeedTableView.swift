//import UIKit
//import Apollo
//
//class QuotesFeedTableView: UITableViewController {
//  var userQueryWatcher: GraphQLQueryWatcher<UserQuery>?
//  
//  var userId: GraphQLID?
//  
//  var userName: String? {
//    didSet {
//      tableView.reloadSections([0], with: .none)
//    }
//  }
//  
//  var postedQuotes: [QuoteDetails]? = [] {
//    didSet {
//      print("hello")
//      tableView.reloadData()
//    }
//  }
//  
//  override func viewDidLoad() {
//    super.viewDidLoad()
//    self.tableView.register(QuoteCell.self, forCellReuseIdentifier: "QuoteCell")
//    fetchUser()
//  }
//  
//  func fetchUser() {
//    let userQuery = UserQuery(id: "1")
//    userQueryWatcher = apollo.watch(query: userQuery) { (result: GraphQLResult?, error: Error?) in
//      if let error = error {
//        print(#function, "ERROR | An error occured: \(error)")
//        return
//      }
//      guard let user = result?.data?.user else {
//        print(#function, "ERROR | Could not retrieve user")
//        return
//      }
//      self.setUserData(user: user)
//    }
//  }
//  
//  func setUserData(user: UserQuery.Data.User) {
//    self.userId = user.id
//    self.userName = user.firstName! + " " + user.lastName!
//    self.postedQuotes = user.postedQuotes?.map { ($0?.fragments.quoteDetails)! }
//  }
//  
//  override func numberOfSections(in tableView: UITableView) -> Int {
//    return 2
//  }
//  
//  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//    if section == 0 {
//      return 1
//    }
//    return postedQuotes?.count ?? 0
//  }
//  
//
//  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//    switch indexPath.section {
//    case 0:
//      let greetingString: String
//      if let userName = userName {
//        greetingString = "Hello \(userName), you have 0 Pokemons in your Pokedex."
//      }
//      else {
//        greetingString = "Hello, you have 0 Pokemons in your Pokedex."
//      }
//      let cell = tableView.dequeueReusableCell(withIdentifier: "QuoteCell", for: indexPath) as! QuoteCell
//      cell.textLabel?.text = greetingString
//      return cell
//    case 1:
//      let cell = tableView.dequeueReusableCell(withIdentifier: "QuoteCell", for: indexPath) as! QuoteCell
//      if let postedQuotes = postedQuotes {
//        cell.postedQuote = postedQuotes[indexPath.row]
//      }
//      return cell
//    default:
//      
//      fatalError("ERROR: Unknown section")
//    }
//  }
//}
