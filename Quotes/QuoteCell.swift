//import UIKit
//import Alamofire
//import AlamofireImage
//
//class QuoteCell: UITableViewCell {
//  
//  var profilePictureImageView: UIImageView!
//  var contentLabel: UILabel!
//  
//  var request: DataRequest!
//  
//  var postedQuote: QuoteDetails? {
//    didSet {
//      updateUI()
//    }
//  }
//  
//  override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
//    super.init(style: style, reuseIdentifier: reuseIdentifier)
//    profilePictureImageView = UIImageView()
//    contentLabel = UILabel()
//  }
//  
//  required init?(coder aDecoder: NSCoder) {
//    fatalError("init(coder:) has not been implemented")
//  }
//  
//  override func prepareForReuse() {
//    super.prepareForReuse()
////    pokemonImageView.image = nil
//    request?.cancel()
//  }
//  
//  func updateUI() {
//    if let content = postedQuote?.content {
//      contentLabel.text = content
//      
//    }
////    if let imageURL = postedQuote?.sayer.profileImage {
////      request = Alamofire.request(imageURL).responseImage { response in
////        if let image = response.result.value {
////          self.pokemonImageView.image = image
////        }
////      }
////    }
//  }
//}
