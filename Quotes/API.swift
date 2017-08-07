//  This file was automatically generated and should not be edited.

import Apollo

public struct QuoteData: GraphQLMapConvertible {
  public var content: Optional<String?>
  public var hearerPhoneNumbers: Optional<[String?]?>
  public var sayerPhoneNumber: Optional<String?>
  public var posterId: Optional<GraphQLID?>
  public var date: Optional<String?>

  public init(content: Optional<String?> = nil, hearerPhoneNumbers: Optional<[String?]?> = nil, sayerPhoneNumber: Optional<String?> = nil, posterId: Optional<GraphQLID?> = nil, date: Optional<String?> = nil) {
    self.content = content
    self.hearerPhoneNumbers = hearerPhoneNumbers
    self.sayerPhoneNumber = sayerPhoneNumber
    self.posterId = posterId
    self.date = date
  }

  public var graphQLMap: GraphQLMap {
    return ["content": content, "hearer_phone_numbers": hearerPhoneNumbers, "sayer_phone_number": sayerPhoneNumber, "poster_id": posterId, "date": date]
  }
}

public final class CreateQuoteMutation: GraphQLMutation {
  public static let operationString =
    "mutation CreateQuote($quote_data: QuoteData) {" +
    "  create_quote(quote_data: $quote_data) {" +
    "    __typename" +
    "    id" +
    "    content" +
    "    date" +
    "    poster_id" +
    "    sayer {" +
    "      __typename" +
    "      ...SayerDetails" +
    "    }" +
    "    hearers {" +
    "      __typename" +
    "      ...HearerDetails" +
    "    }" +
    "  }" +
    "}"

  public static var requestString: String { return operationString.appending(SayerDetails.fragmentString).appending(HearerDetails.fragmentString) }

  public var quote_data: QuoteData?

  public init(quote_data: QuoteData? = nil) {
    self.quote_data = quote_data
  }

  public var variables: GraphQLMap? {
    return ["quote_data": quote_data]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [Selection] = [
      Field("create_quote", arguments: ["quote_data": Variable("quote_data")], type: .object(Data.CreateQuote.self)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(createQuote: CreateQuote? = nil) {
      self.init(snapshot: ["__typename": "Mutation", "createQuote": createQuote])
    }

    public var createQuote: CreateQuote? {
      get {
        return (snapshot["create_quote"]! as! Snapshot?).flatMap { CreateQuote(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "create_quote")
      }
    }

    public struct CreateQuote: GraphQLSelectionSet {
      public static let possibleTypes = ["Quote"]

      public static let selections: [Selection] = [
        Field("__typename", type: .nonNull(.scalar(String.self))),
        Field("id", type: .scalar(GraphQLID.self)),
        Field("content", type: .scalar(String.self)),
        Field("date", type: .scalar(String.self)),
        Field("poster_id", type: .scalar(GraphQLID.self)),
        Field("sayer", type: .object(CreateQuote.Sayer.self)),
        Field("hearers", type: .list(.object(CreateQuote.Hearer.self))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: GraphQLID? = nil, content: String? = nil, date: String? = nil, posterId: GraphQLID? = nil, sayer: Sayer? = nil, hearers: [Hearer?]? = nil) {
        self.init(snapshot: ["__typename": "Quote", "id": id, "content": content, "date": date, "posterId": posterId, "sayer": sayer, "hearers": hearers])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID? {
        get {
          return snapshot["id"]! as! GraphQLID?
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      public var content: String? {
        get {
          return snapshot["content"]! as! String?
        }
        set {
          snapshot.updateValue(newValue, forKey: "content")
        }
      }

      public var date: String? {
        get {
          return snapshot["date"]! as! String?
        }
        set {
          snapshot.updateValue(newValue, forKey: "date")
        }
      }

      public var posterId: GraphQLID? {
        get {
          return snapshot["poster_id"]! as! GraphQLID?
        }
        set {
          snapshot.updateValue(newValue, forKey: "poster_id")
        }
      }

      public var sayer: Sayer? {
        get {
          return (snapshot["sayer"]! as! Snapshot?).flatMap { Sayer(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue?.snapshot, forKey: "sayer")
        }
      }

      public var hearers: [Hearer?]? {
        get {
          return (snapshot["hearers"]! as! [Snapshot?]?).flatMap { $0.map { $0.flatMap { Hearer(snapshot: $0) } } }
        }
        set {
          snapshot.updateValue(newValue.flatMap { $0.map { $0.flatMap { $0.snapshot } } }, forKey: "hearers")
        }
      }

      public struct Sayer: GraphQLSelectionSet {
        public static let possibleTypes = ["User"]

        public static let selections: [Selection] = [
          Field("__typename", type: .nonNull(.scalar(String.self))),
          Field("id", type: .scalar(GraphQLID.self)),
          Field("first_name", type: .scalar(String.self)),
          Field("last_name", type: .scalar(String.self)),
          Field("phone_number", type: .scalar(String.self)),
          Field("profile_pic_url", type: .scalar(String.self)),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(id: GraphQLID? = nil, firstName: String? = nil, lastName: String? = nil, phoneNumber: String? = nil, profilePicUrl: String? = nil) {
          self.init(snapshot: ["__typename": "User", "id": id, "firstName": firstName, "lastName": lastName, "phoneNumber": phoneNumber, "profilePicUrl": profilePicUrl])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: GraphQLID? {
          get {
            return snapshot["id"]! as! GraphQLID?
          }
          set {
            snapshot.updateValue(newValue, forKey: "id")
          }
        }

        public var firstName: String? {
          get {
            return snapshot["first_name"]! as! String?
          }
          set {
            snapshot.updateValue(newValue, forKey: "first_name")
          }
        }

        public var lastName: String? {
          get {
            return snapshot["last_name"]! as! String?
          }
          set {
            snapshot.updateValue(newValue, forKey: "last_name")
          }
        }

        public var phoneNumber: String? {
          get {
            return snapshot["phone_number"]! as! String?
          }
          set {
            snapshot.updateValue(newValue, forKey: "phone_number")
          }
        }

        public var profilePicUrl: String? {
          get {
            return snapshot["profile_pic_url"]! as! String?
          }
          set {
            snapshot.updateValue(newValue, forKey: "profile_pic_url")
          }
        }

        public var fragments: Fragments {
          get {
            return Fragments(snapshot: snapshot)
          }
          set {
            snapshot = newValue.snapshot
          }
        }

        public struct Fragments {
          public var snapshot: Snapshot

          public var sayerDetails: SayerDetails {
            get {
              return SayerDetails(snapshot: snapshot)
            }
            set {
              snapshot = newValue.snapshot
            }
          }
        }
      }

      public struct Hearer: GraphQLSelectionSet {
        public static let possibleTypes = ["User"]

        public static let selections: [Selection] = [
          Field("__typename", type: .nonNull(.scalar(String.self))),
          Field("id", type: .scalar(GraphQLID.self)),
          Field("first_name", type: .scalar(String.self)),
          Field("last_name", type: .scalar(String.self)),
          Field("phone_number", type: .scalar(String.self)),
          Field("profile_pic_url", type: .scalar(String.self)),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(id: GraphQLID? = nil, firstName: String? = nil, lastName: String? = nil, phoneNumber: String? = nil, profilePicUrl: String? = nil) {
          self.init(snapshot: ["__typename": "User", "id": id, "firstName": firstName, "lastName": lastName, "phoneNumber": phoneNumber, "profilePicUrl": profilePicUrl])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: GraphQLID? {
          get {
            return snapshot["id"]! as! GraphQLID?
          }
          set {
            snapshot.updateValue(newValue, forKey: "id")
          }
        }

        public var firstName: String? {
          get {
            return snapshot["first_name"]! as! String?
          }
          set {
            snapshot.updateValue(newValue, forKey: "first_name")
          }
        }

        public var lastName: String? {
          get {
            return snapshot["last_name"]! as! String?
          }
          set {
            snapshot.updateValue(newValue, forKey: "last_name")
          }
        }

        public var phoneNumber: String? {
          get {
            return snapshot["phone_number"]! as! String?
          }
          set {
            snapshot.updateValue(newValue, forKey: "phone_number")
          }
        }

        public var profilePicUrl: String? {
          get {
            return snapshot["profile_pic_url"]! as! String?
          }
          set {
            snapshot.updateValue(newValue, forKey: "profile_pic_url")
          }
        }

        public var fragments: Fragments {
          get {
            return Fragments(snapshot: snapshot)
          }
          set {
            snapshot = newValue.snapshot
          }
        }

        public struct Fragments {
          public var snapshot: Snapshot

          public var hearerDetails: HearerDetails {
            get {
              return HearerDetails(snapshot: snapshot)
            }
            set {
              snapshot = newValue.snapshot
            }
          }
        }
      }
    }
  }
}

public final class UserQuery: GraphQLQuery {
  public static let operationString =
    "query User($id: ID!) {" +
    "  user(id: $id) {" +
    "    __typename" +
    "    id" +
    "    first_name" +
    "    last_name" +
    "    posted_quotes {" +
    "      __typename" +
    "      ...QuoteDetails" +
    "    }" +
    "    heard_quotes {" +
    "      __typename" +
    "      ...QuoteDetails" +
    "    }" +
    "    said_quotes {" +
    "      __typename" +
    "      ...QuoteDetails" +
    "    }" +
    "  }" +
    "}"

  public static var requestString: String { return operationString.appending(SayerDetails.fragmentString).appending(HearerDetails.fragmentString).appending(QuoteDetails.fragmentString) }

  public var id: GraphQLID

  public init(id: GraphQLID) {
    self.id = id
  }

  public var variables: GraphQLMap? {
    return ["id": id]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [Selection] = [
      Field("user", arguments: ["id": Variable("id")], type: .object(Data.User.self)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(user: User? = nil) {
      self.init(snapshot: ["__typename": "Query", "user": user])
    }

    public var user: User? {
      get {
        return (snapshot["user"]! as! Snapshot?).flatMap { User(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "user")
      }
    }

    public struct User: GraphQLSelectionSet {
      public static let possibleTypes = ["User"]

      public static let selections: [Selection] = [
        Field("__typename", type: .nonNull(.scalar(String.self))),
        Field("id", type: .scalar(GraphQLID.self)),
        Field("first_name", type: .scalar(String.self)),
        Field("last_name", type: .scalar(String.self)),
        Field("posted_quotes", type: .list(.object(User.PostedQuote.self))),
        Field("heard_quotes", type: .list(.object(User.HeardQuote.self))),
        Field("said_quotes", type: .list(.object(User.SaidQuote.self))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: GraphQLID? = nil, firstName: String? = nil, lastName: String? = nil, postedQuotes: [PostedQuote?]? = nil, heardQuotes: [HeardQuote?]? = nil, saidQuotes: [SaidQuote?]? = nil) {
        self.init(snapshot: ["__typename": "User", "id": id, "firstName": firstName, "lastName": lastName, "postedQuotes": postedQuotes, "heardQuotes": heardQuotes, "saidQuotes": saidQuotes])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID? {
        get {
          return snapshot["id"]! as! GraphQLID?
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      public var firstName: String? {
        get {
          return snapshot["first_name"]! as! String?
        }
        set {
          snapshot.updateValue(newValue, forKey: "first_name")
        }
      }

      public var lastName: String? {
        get {
          return snapshot["last_name"]! as! String?
        }
        set {
          snapshot.updateValue(newValue, forKey: "last_name")
        }
      }

      public var postedQuotes: [PostedQuote?]? {
        get {
          return (snapshot["posted_quotes"]! as! [Snapshot?]?).flatMap { $0.map { $0.flatMap { PostedQuote(snapshot: $0) } } }
        }
        set {
          snapshot.updateValue(newValue.flatMap { $0.map { $0.flatMap { $0.snapshot } } }, forKey: "posted_quotes")
        }
      }

      public var heardQuotes: [HeardQuote?]? {
        get {
          return (snapshot["heard_quotes"]! as! [Snapshot?]?).flatMap { $0.map { $0.flatMap { HeardQuote(snapshot: $0) } } }
        }
        set {
          snapshot.updateValue(newValue.flatMap { $0.map { $0.flatMap { $0.snapshot } } }, forKey: "heard_quotes")
        }
      }

      public var saidQuotes: [SaidQuote?]? {
        get {
          return (snapshot["said_quotes"]! as! [Snapshot?]?).flatMap { $0.map { $0.flatMap { SaidQuote(snapshot: $0) } } }
        }
        set {
          snapshot.updateValue(newValue.flatMap { $0.map { $0.flatMap { $0.snapshot } } }, forKey: "said_quotes")
        }
      }

      public struct PostedQuote: GraphQLSelectionSet {
        public static let possibleTypes = ["Quote"]

        public static let selections: [Selection] = [
          Field("__typename", type: .nonNull(.scalar(String.self))),
          Field("id", type: .scalar(GraphQLID.self)),
          Field("content", type: .scalar(String.self)),
          Field("date", type: .scalar(String.self)),
          Field("sayer", type: .object(PostedQuote.Sayer.self)),
          Field("hearers", type: .list(.object(PostedQuote.Hearer.self))),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(id: GraphQLID? = nil, content: String? = nil, date: String? = nil, sayer: Sayer? = nil, hearers: [Hearer?]? = nil) {
          self.init(snapshot: ["__typename": "Quote", "id": id, "content": content, "date": date, "sayer": sayer, "hearers": hearers])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: GraphQLID? {
          get {
            return snapshot["id"]! as! GraphQLID?
          }
          set {
            snapshot.updateValue(newValue, forKey: "id")
          }
        }

        public var content: String? {
          get {
            return snapshot["content"]! as! String?
          }
          set {
            snapshot.updateValue(newValue, forKey: "content")
          }
        }

        public var date: String? {
          get {
            return snapshot["date"]! as! String?
          }
          set {
            snapshot.updateValue(newValue, forKey: "date")
          }
        }

        public var sayer: Sayer? {
          get {
            return (snapshot["sayer"]! as! Snapshot?).flatMap { Sayer(snapshot: $0) }
          }
          set {
            snapshot.updateValue(newValue?.snapshot, forKey: "sayer")
          }
        }

        public var hearers: [Hearer?]? {
          get {
            return (snapshot["hearers"]! as! [Snapshot?]?).flatMap { $0.map { $0.flatMap { Hearer(snapshot: $0) } } }
          }
          set {
            snapshot.updateValue(newValue.flatMap { $0.map { $0.flatMap { $0.snapshot } } }, forKey: "hearers")
          }
        }

        public var fragments: Fragments {
          get {
            return Fragments(snapshot: snapshot)
          }
          set {
            snapshot = newValue.snapshot
          }
        }

        public struct Fragments {
          public var snapshot: Snapshot

          public var quoteDetails: QuoteDetails {
            get {
              return QuoteDetails(snapshot: snapshot)
            }
            set {
              snapshot = newValue.snapshot
            }
          }
        }

        public struct Sayer: GraphQLSelectionSet {
          public static let possibleTypes = ["User"]

          public static let selections: [Selection] = [
            Field("__typename", type: .nonNull(.scalar(String.self))),
            Field("id", type: .scalar(GraphQLID.self)),
            Field("first_name", type: .scalar(String.self)),
            Field("last_name", type: .scalar(String.self)),
            Field("phone_number", type: .scalar(String.self)),
            Field("profile_pic_url", type: .scalar(String.self)),
          ]

          public var snapshot: Snapshot

          public init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          public init(id: GraphQLID? = nil, firstName: String? = nil, lastName: String? = nil, phoneNumber: String? = nil, profilePicUrl: String? = nil) {
            self.init(snapshot: ["__typename": "User", "id": id, "firstName": firstName, "lastName": lastName, "phoneNumber": phoneNumber, "profilePicUrl": profilePicUrl])
          }

          public var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          public var id: GraphQLID? {
            get {
              return snapshot["id"]! as! GraphQLID?
            }
            set {
              snapshot.updateValue(newValue, forKey: "id")
            }
          }

          public var firstName: String? {
            get {
              return snapshot["first_name"]! as! String?
            }
            set {
              snapshot.updateValue(newValue, forKey: "first_name")
            }
          }

          public var lastName: String? {
            get {
              return snapshot["last_name"]! as! String?
            }
            set {
              snapshot.updateValue(newValue, forKey: "last_name")
            }
          }

          public var phoneNumber: String? {
            get {
              return snapshot["phone_number"]! as! String?
            }
            set {
              snapshot.updateValue(newValue, forKey: "phone_number")
            }
          }

          public var profilePicUrl: String? {
            get {
              return snapshot["profile_pic_url"]! as! String?
            }
            set {
              snapshot.updateValue(newValue, forKey: "profile_pic_url")
            }
          }

          public var fragments: Fragments {
            get {
              return Fragments(snapshot: snapshot)
            }
            set {
              snapshot = newValue.snapshot
            }
          }

          public struct Fragments {
            public var snapshot: Snapshot

            public var sayerDetails: SayerDetails {
              get {
                return SayerDetails(snapshot: snapshot)
              }
              set {
                snapshot = newValue.snapshot
              }
            }
          }
        }

        public struct Hearer: GraphQLSelectionSet {
          public static let possibleTypes = ["User"]

          public static let selections: [Selection] = [
            Field("__typename", type: .nonNull(.scalar(String.self))),
            Field("id", type: .scalar(GraphQLID.self)),
            Field("first_name", type: .scalar(String.self)),
            Field("last_name", type: .scalar(String.self)),
            Field("phone_number", type: .scalar(String.self)),
            Field("profile_pic_url", type: .scalar(String.self)),
          ]

          public var snapshot: Snapshot

          public init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          public init(id: GraphQLID? = nil, firstName: String? = nil, lastName: String? = nil, phoneNumber: String? = nil, profilePicUrl: String? = nil) {
            self.init(snapshot: ["__typename": "User", "id": id, "firstName": firstName, "lastName": lastName, "phoneNumber": phoneNumber, "profilePicUrl": profilePicUrl])
          }

          public var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          public var id: GraphQLID? {
            get {
              return snapshot["id"]! as! GraphQLID?
            }
            set {
              snapshot.updateValue(newValue, forKey: "id")
            }
          }

          public var firstName: String? {
            get {
              return snapshot["first_name"]! as! String?
            }
            set {
              snapshot.updateValue(newValue, forKey: "first_name")
            }
          }

          public var lastName: String? {
            get {
              return snapshot["last_name"]! as! String?
            }
            set {
              snapshot.updateValue(newValue, forKey: "last_name")
            }
          }

          public var phoneNumber: String? {
            get {
              return snapshot["phone_number"]! as! String?
            }
            set {
              snapshot.updateValue(newValue, forKey: "phone_number")
            }
          }

          public var profilePicUrl: String? {
            get {
              return snapshot["profile_pic_url"]! as! String?
            }
            set {
              snapshot.updateValue(newValue, forKey: "profile_pic_url")
            }
          }

          public var fragments: Fragments {
            get {
              return Fragments(snapshot: snapshot)
            }
            set {
              snapshot = newValue.snapshot
            }
          }

          public struct Fragments {
            public var snapshot: Snapshot

            public var hearerDetails: HearerDetails {
              get {
                return HearerDetails(snapshot: snapshot)
              }
              set {
                snapshot = newValue.snapshot
              }
            }
          }
        }
      }

      public struct HeardQuote: GraphQLSelectionSet {
        public static let possibleTypes = ["Quote"]

        public static let selections: [Selection] = [
          Field("__typename", type: .nonNull(.scalar(String.self))),
          Field("id", type: .scalar(GraphQLID.self)),
          Field("content", type: .scalar(String.self)),
          Field("date", type: .scalar(String.self)),
          Field("sayer", type: .object(HeardQuote.Sayer.self)),
          Field("hearers", type: .list(.object(HeardQuote.Hearer.self))),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(id: GraphQLID? = nil, content: String? = nil, date: String? = nil, sayer: Sayer? = nil, hearers: [Hearer?]? = nil) {
          self.init(snapshot: ["__typename": "Quote", "id": id, "content": content, "date": date, "sayer": sayer, "hearers": hearers])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: GraphQLID? {
          get {
            return snapshot["id"]! as! GraphQLID?
          }
          set {
            snapshot.updateValue(newValue, forKey: "id")
          }
        }

        public var content: String? {
          get {
            return snapshot["content"]! as! String?
          }
          set {
            snapshot.updateValue(newValue, forKey: "content")
          }
        }

        public var date: String? {
          get {
            return snapshot["date"]! as! String?
          }
          set {
            snapshot.updateValue(newValue, forKey: "date")
          }
        }

        public var sayer: Sayer? {
          get {
            return (snapshot["sayer"]! as! Snapshot?).flatMap { Sayer(snapshot: $0) }
          }
          set {
            snapshot.updateValue(newValue?.snapshot, forKey: "sayer")
          }
        }

        public var hearers: [Hearer?]? {
          get {
            return (snapshot["hearers"]! as! [Snapshot?]?).flatMap { $0.map { $0.flatMap { Hearer(snapshot: $0) } } }
          }
          set {
            snapshot.updateValue(newValue.flatMap { $0.map { $0.flatMap { $0.snapshot } } }, forKey: "hearers")
          }
        }

        public var fragments: Fragments {
          get {
            return Fragments(snapshot: snapshot)
          }
          set {
            snapshot = newValue.snapshot
          }
        }

        public struct Fragments {
          public var snapshot: Snapshot

          public var quoteDetails: QuoteDetails {
            get {
              return QuoteDetails(snapshot: snapshot)
            }
            set {
              snapshot = newValue.snapshot
            }
          }
        }

        public struct Sayer: GraphQLSelectionSet {
          public static let possibleTypes = ["User"]

          public static let selections: [Selection] = [
            Field("__typename", type: .nonNull(.scalar(String.self))),
            Field("id", type: .scalar(GraphQLID.self)),
            Field("first_name", type: .scalar(String.self)),
            Field("last_name", type: .scalar(String.self)),
            Field("phone_number", type: .scalar(String.self)),
            Field("profile_pic_url", type: .scalar(String.self)),
          ]

          public var snapshot: Snapshot

          public init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          public init(id: GraphQLID? = nil, firstName: String? = nil, lastName: String? = nil, phoneNumber: String? = nil, profilePicUrl: String? = nil) {
            self.init(snapshot: ["__typename": "User", "id": id, "firstName": firstName, "lastName": lastName, "phoneNumber": phoneNumber, "profilePicUrl": profilePicUrl])
          }

          public var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          public var id: GraphQLID? {
            get {
              return snapshot["id"]! as! GraphQLID?
            }
            set {
              snapshot.updateValue(newValue, forKey: "id")
            }
          }

          public var firstName: String? {
            get {
              return snapshot["first_name"]! as! String?
            }
            set {
              snapshot.updateValue(newValue, forKey: "first_name")
            }
          }

          public var lastName: String? {
            get {
              return snapshot["last_name"]! as! String?
            }
            set {
              snapshot.updateValue(newValue, forKey: "last_name")
            }
          }

          public var phoneNumber: String? {
            get {
              return snapshot["phone_number"]! as! String?
            }
            set {
              snapshot.updateValue(newValue, forKey: "phone_number")
            }
          }

          public var profilePicUrl: String? {
            get {
              return snapshot["profile_pic_url"]! as! String?
            }
            set {
              snapshot.updateValue(newValue, forKey: "profile_pic_url")
            }
          }

          public var fragments: Fragments {
            get {
              return Fragments(snapshot: snapshot)
            }
            set {
              snapshot = newValue.snapshot
            }
          }

          public struct Fragments {
            public var snapshot: Snapshot

            public var sayerDetails: SayerDetails {
              get {
                return SayerDetails(snapshot: snapshot)
              }
              set {
                snapshot = newValue.snapshot
              }
            }
          }
        }

        public struct Hearer: GraphQLSelectionSet {
          public static let possibleTypes = ["User"]

          public static let selections: [Selection] = [
            Field("__typename", type: .nonNull(.scalar(String.self))),
            Field("id", type: .scalar(GraphQLID.self)),
            Field("first_name", type: .scalar(String.self)),
            Field("last_name", type: .scalar(String.self)),
            Field("phone_number", type: .scalar(String.self)),
            Field("profile_pic_url", type: .scalar(String.self)),
          ]

          public var snapshot: Snapshot

          public init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          public init(id: GraphQLID? = nil, firstName: String? = nil, lastName: String? = nil, phoneNumber: String? = nil, profilePicUrl: String? = nil) {
            self.init(snapshot: ["__typename": "User", "id": id, "firstName": firstName, "lastName": lastName, "phoneNumber": phoneNumber, "profilePicUrl": profilePicUrl])
          }

          public var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          public var id: GraphQLID? {
            get {
              return snapshot["id"]! as! GraphQLID?
            }
            set {
              snapshot.updateValue(newValue, forKey: "id")
            }
          }

          public var firstName: String? {
            get {
              return snapshot["first_name"]! as! String?
            }
            set {
              snapshot.updateValue(newValue, forKey: "first_name")
            }
          }

          public var lastName: String? {
            get {
              return snapshot["last_name"]! as! String?
            }
            set {
              snapshot.updateValue(newValue, forKey: "last_name")
            }
          }

          public var phoneNumber: String? {
            get {
              return snapshot["phone_number"]! as! String?
            }
            set {
              snapshot.updateValue(newValue, forKey: "phone_number")
            }
          }

          public var profilePicUrl: String? {
            get {
              return snapshot["profile_pic_url"]! as! String?
            }
            set {
              snapshot.updateValue(newValue, forKey: "profile_pic_url")
            }
          }

          public var fragments: Fragments {
            get {
              return Fragments(snapshot: snapshot)
            }
            set {
              snapshot = newValue.snapshot
            }
          }

          public struct Fragments {
            public var snapshot: Snapshot

            public var hearerDetails: HearerDetails {
              get {
                return HearerDetails(snapshot: snapshot)
              }
              set {
                snapshot = newValue.snapshot
              }
            }
          }
        }
      }

      public struct SaidQuote: GraphQLSelectionSet {
        public static let possibleTypes = ["Quote"]

        public static let selections: [Selection] = [
          Field("__typename", type: .nonNull(.scalar(String.self))),
          Field("id", type: .scalar(GraphQLID.self)),
          Field("content", type: .scalar(String.self)),
          Field("date", type: .scalar(String.self)),
          Field("sayer", type: .object(SaidQuote.Sayer.self)),
          Field("hearers", type: .list(.object(SaidQuote.Hearer.self))),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(id: GraphQLID? = nil, content: String? = nil, date: String? = nil, sayer: Sayer? = nil, hearers: [Hearer?]? = nil) {
          self.init(snapshot: ["__typename": "Quote", "id": id, "content": content, "date": date, "sayer": sayer, "hearers": hearers])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: GraphQLID? {
          get {
            return snapshot["id"]! as! GraphQLID?
          }
          set {
            snapshot.updateValue(newValue, forKey: "id")
          }
        }

        public var content: String? {
          get {
            return snapshot["content"]! as! String?
          }
          set {
            snapshot.updateValue(newValue, forKey: "content")
          }
        }

        public var date: String? {
          get {
            return snapshot["date"]! as! String?
          }
          set {
            snapshot.updateValue(newValue, forKey: "date")
          }
        }

        public var sayer: Sayer? {
          get {
            return (snapshot["sayer"]! as! Snapshot?).flatMap { Sayer(snapshot: $0) }
          }
          set {
            snapshot.updateValue(newValue?.snapshot, forKey: "sayer")
          }
        }

        public var hearers: [Hearer?]? {
          get {
            return (snapshot["hearers"]! as! [Snapshot?]?).flatMap { $0.map { $0.flatMap { Hearer(snapshot: $0) } } }
          }
          set {
            snapshot.updateValue(newValue.flatMap { $0.map { $0.flatMap { $0.snapshot } } }, forKey: "hearers")
          }
        }

        public var fragments: Fragments {
          get {
            return Fragments(snapshot: snapshot)
          }
          set {
            snapshot = newValue.snapshot
          }
        }

        public struct Fragments {
          public var snapshot: Snapshot

          public var quoteDetails: QuoteDetails {
            get {
              return QuoteDetails(snapshot: snapshot)
            }
            set {
              snapshot = newValue.snapshot
            }
          }
        }

        public struct Sayer: GraphQLSelectionSet {
          public static let possibleTypes = ["User"]

          public static let selections: [Selection] = [
            Field("__typename", type: .nonNull(.scalar(String.self))),
            Field("id", type: .scalar(GraphQLID.self)),
            Field("first_name", type: .scalar(String.self)),
            Field("last_name", type: .scalar(String.self)),
            Field("phone_number", type: .scalar(String.self)),
            Field("profile_pic_url", type: .scalar(String.self)),
          ]

          public var snapshot: Snapshot

          public init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          public init(id: GraphQLID? = nil, firstName: String? = nil, lastName: String? = nil, phoneNumber: String? = nil, profilePicUrl: String? = nil) {
            self.init(snapshot: ["__typename": "User", "id": id, "firstName": firstName, "lastName": lastName, "phoneNumber": phoneNumber, "profilePicUrl": profilePicUrl])
          }

          public var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          public var id: GraphQLID? {
            get {
              return snapshot["id"]! as! GraphQLID?
            }
            set {
              snapshot.updateValue(newValue, forKey: "id")
            }
          }

          public var firstName: String? {
            get {
              return snapshot["first_name"]! as! String?
            }
            set {
              snapshot.updateValue(newValue, forKey: "first_name")
            }
          }

          public var lastName: String? {
            get {
              return snapshot["last_name"]! as! String?
            }
            set {
              snapshot.updateValue(newValue, forKey: "last_name")
            }
          }

          public var phoneNumber: String? {
            get {
              return snapshot["phone_number"]! as! String?
            }
            set {
              snapshot.updateValue(newValue, forKey: "phone_number")
            }
          }

          public var profilePicUrl: String? {
            get {
              return snapshot["profile_pic_url"]! as! String?
            }
            set {
              snapshot.updateValue(newValue, forKey: "profile_pic_url")
            }
          }

          public var fragments: Fragments {
            get {
              return Fragments(snapshot: snapshot)
            }
            set {
              snapshot = newValue.snapshot
            }
          }

          public struct Fragments {
            public var snapshot: Snapshot

            public var sayerDetails: SayerDetails {
              get {
                return SayerDetails(snapshot: snapshot)
              }
              set {
                snapshot = newValue.snapshot
              }
            }
          }
        }

        public struct Hearer: GraphQLSelectionSet {
          public static let possibleTypes = ["User"]

          public static let selections: [Selection] = [
            Field("__typename", type: .nonNull(.scalar(String.self))),
            Field("id", type: .scalar(GraphQLID.self)),
            Field("first_name", type: .scalar(String.self)),
            Field("last_name", type: .scalar(String.self)),
            Field("phone_number", type: .scalar(String.self)),
            Field("profile_pic_url", type: .scalar(String.self)),
          ]

          public var snapshot: Snapshot

          public init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          public init(id: GraphQLID? = nil, firstName: String? = nil, lastName: String? = nil, phoneNumber: String? = nil, profilePicUrl: String? = nil) {
            self.init(snapshot: ["__typename": "User", "id": id, "firstName": firstName, "lastName": lastName, "phoneNumber": phoneNumber, "profilePicUrl": profilePicUrl])
          }

          public var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          public var id: GraphQLID? {
            get {
              return snapshot["id"]! as! GraphQLID?
            }
            set {
              snapshot.updateValue(newValue, forKey: "id")
            }
          }

          public var firstName: String? {
            get {
              return snapshot["first_name"]! as! String?
            }
            set {
              snapshot.updateValue(newValue, forKey: "first_name")
            }
          }

          public var lastName: String? {
            get {
              return snapshot["last_name"]! as! String?
            }
            set {
              snapshot.updateValue(newValue, forKey: "last_name")
            }
          }

          public var phoneNumber: String? {
            get {
              return snapshot["phone_number"]! as! String?
            }
            set {
              snapshot.updateValue(newValue, forKey: "phone_number")
            }
          }

          public var profilePicUrl: String? {
            get {
              return snapshot["profile_pic_url"]! as! String?
            }
            set {
              snapshot.updateValue(newValue, forKey: "profile_pic_url")
            }
          }

          public var fragments: Fragments {
            get {
              return Fragments(snapshot: snapshot)
            }
            set {
              snapshot = newValue.snapshot
            }
          }

          public struct Fragments {
            public var snapshot: Snapshot

            public var hearerDetails: HearerDetails {
              get {
                return HearerDetails(snapshot: snapshot)
              }
              set {
                snapshot = newValue.snapshot
              }
            }
          }
        }
      }
    }
  }
}

public struct QuoteDetails: GraphQLFragment {
  public static let fragmentString =
    "fragment QuoteDetails on Quote {" +
    "  __typename" +
    "  id" +
    "  content" +
    "  date" +
    "  sayer {" +
    "    __typename" +
    "    ...SayerDetails" +
    "  }" +
    "  hearers {" +
    "    __typename" +
    "    ...HearerDetails" +
    "  }" +
    "}"

  public static let possibleTypes = ["Quote"]

  public static let selections: [Selection] = [
    Field("__typename", type: .nonNull(.scalar(String.self))),
    Field("id", type: .scalar(GraphQLID.self)),
    Field("content", type: .scalar(String.self)),
    Field("date", type: .scalar(String.self)),
    Field("sayer", type: .object(QuoteDetails.Sayer.self)),
    Field("hearers", type: .list(.object(QuoteDetails.Hearer.self))),
  ]

  public var snapshot: Snapshot

  public init(snapshot: Snapshot) {
    self.snapshot = snapshot
  }

  public init(id: GraphQLID? = nil, content: String? = nil, date: String? = nil, sayer: Sayer? = nil, hearers: [Hearer?]? = nil) {
    self.init(snapshot: ["__typename": "Quote", "id": id, "content": content, "date": date, "sayer": sayer, "hearers": hearers])
  }

  public var __typename: String {
    get {
      return snapshot["__typename"]! as! String
    }
    set {
      snapshot.updateValue(newValue, forKey: "__typename")
    }
  }

  public var id: GraphQLID? {
    get {
      return snapshot["id"]! as! GraphQLID?
    }
    set {
      snapshot.updateValue(newValue, forKey: "id")
    }
  }

  public var content: String? {
    get {
      return snapshot["content"]! as! String?
    }
    set {
      snapshot.updateValue(newValue, forKey: "content")
    }
  }

  public var date: String? {
    get {
      return snapshot["date"]! as! String?
    }
    set {
      snapshot.updateValue(newValue, forKey: "date")
    }
  }

  public var sayer: Sayer? {
    get {
      return (snapshot["sayer"]! as! Snapshot?).flatMap { Sayer(snapshot: $0) }
    }
    set {
      snapshot.updateValue(newValue?.snapshot, forKey: "sayer")
    }
  }

  public var hearers: [Hearer?]? {
    get {
      return (snapshot["hearers"]! as! [Snapshot?]?).flatMap { $0.map { $0.flatMap { Hearer(snapshot: $0) } } }
    }
    set {
      snapshot.updateValue(newValue.flatMap { $0.map { $0.flatMap { $0.snapshot } } }, forKey: "hearers")
    }
  }

  public struct Sayer: GraphQLSelectionSet {
    public static let possibleTypes = ["User"]

    public static let selections: [Selection] = [
      Field("__typename", type: .nonNull(.scalar(String.self))),
      Field("id", type: .scalar(GraphQLID.self)),
      Field("first_name", type: .scalar(String.self)),
      Field("last_name", type: .scalar(String.self)),
      Field("phone_number", type: .scalar(String.self)),
      Field("profile_pic_url", type: .scalar(String.self)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(id: GraphQLID? = nil, firstName: String? = nil, lastName: String? = nil, phoneNumber: String? = nil, profilePicUrl: String? = nil) {
      self.init(snapshot: ["__typename": "User", "id": id, "firstName": firstName, "lastName": lastName, "phoneNumber": phoneNumber, "profilePicUrl": profilePicUrl])
    }

    public var __typename: String {
      get {
        return snapshot["__typename"]! as! String
      }
      set {
        snapshot.updateValue(newValue, forKey: "__typename")
      }
    }

    public var id: GraphQLID? {
      get {
        return snapshot["id"]! as! GraphQLID?
      }
      set {
        snapshot.updateValue(newValue, forKey: "id")
      }
    }

    public var firstName: String? {
      get {
        return snapshot["first_name"]! as! String?
      }
      set {
        snapshot.updateValue(newValue, forKey: "first_name")
      }
    }

    public var lastName: String? {
      get {
        return snapshot["last_name"]! as! String?
      }
      set {
        snapshot.updateValue(newValue, forKey: "last_name")
      }
    }

    public var phoneNumber: String? {
      get {
        return snapshot["phone_number"]! as! String?
      }
      set {
        snapshot.updateValue(newValue, forKey: "phone_number")
      }
    }

    public var profilePicUrl: String? {
      get {
        return snapshot["profile_pic_url"]! as! String?
      }
      set {
        snapshot.updateValue(newValue, forKey: "profile_pic_url")
      }
    }

    public var fragments: Fragments {
      get {
        return Fragments(snapshot: snapshot)
      }
      set {
        snapshot = newValue.snapshot
      }
    }

    public struct Fragments {
      public var snapshot: Snapshot

      public var sayerDetails: SayerDetails {
        get {
          return SayerDetails(snapshot: snapshot)
        }
        set {
          snapshot = newValue.snapshot
        }
      }
    }
  }

  public struct Hearer: GraphQLSelectionSet {
    public static let possibleTypes = ["User"]

    public static let selections: [Selection] = [
      Field("__typename", type: .nonNull(.scalar(String.self))),
      Field("id", type: .scalar(GraphQLID.self)),
      Field("first_name", type: .scalar(String.self)),
      Field("last_name", type: .scalar(String.self)),
      Field("phone_number", type: .scalar(String.self)),
      Field("profile_pic_url", type: .scalar(String.self)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(id: GraphQLID? = nil, firstName: String? = nil, lastName: String? = nil, phoneNumber: String? = nil, profilePicUrl: String? = nil) {
      self.init(snapshot: ["__typename": "User", "id": id, "firstName": firstName, "lastName": lastName, "phoneNumber": phoneNumber, "profilePicUrl": profilePicUrl])
    }

    public var __typename: String {
      get {
        return snapshot["__typename"]! as! String
      }
      set {
        snapshot.updateValue(newValue, forKey: "__typename")
      }
    }

    public var id: GraphQLID? {
      get {
        return snapshot["id"]! as! GraphQLID?
      }
      set {
        snapshot.updateValue(newValue, forKey: "id")
      }
    }

    public var firstName: String? {
      get {
        return snapshot["first_name"]! as! String?
      }
      set {
        snapshot.updateValue(newValue, forKey: "first_name")
      }
    }

    public var lastName: String? {
      get {
        return snapshot["last_name"]! as! String?
      }
      set {
        snapshot.updateValue(newValue, forKey: "last_name")
      }
    }

    public var phoneNumber: String? {
      get {
        return snapshot["phone_number"]! as! String?
      }
      set {
        snapshot.updateValue(newValue, forKey: "phone_number")
      }
    }

    public var profilePicUrl: String? {
      get {
        return snapshot["profile_pic_url"]! as! String?
      }
      set {
        snapshot.updateValue(newValue, forKey: "profile_pic_url")
      }
    }

    public var fragments: Fragments {
      get {
        return Fragments(snapshot: snapshot)
      }
      set {
        snapshot = newValue.snapshot
      }
    }

    public struct Fragments {
      public var snapshot: Snapshot

      public var hearerDetails: HearerDetails {
        get {
          return HearerDetails(snapshot: snapshot)
        }
        set {
          snapshot = newValue.snapshot
        }
      }
    }
  }
}

public struct SayerDetails: GraphQLFragment {
  public static let fragmentString =
    "fragment SayerDetails on User {" +
    "  __typename" +
    "  id" +
    "  first_name" +
    "  last_name" +
    "  phone_number" +
    "  profile_pic_url" +
    "}"

  public static let possibleTypes = ["User"]

  public static let selections: [Selection] = [
    Field("__typename", type: .nonNull(.scalar(String.self))),
    Field("id", type: .scalar(GraphQLID.self)),
    Field("first_name", type: .scalar(String.self)),
    Field("last_name", type: .scalar(String.self)),
    Field("phone_number", type: .scalar(String.self)),
    Field("profile_pic_url", type: .scalar(String.self)),
  ]

  public var snapshot: Snapshot

  public init(snapshot: Snapshot) {
    self.snapshot = snapshot
  }

  public init(id: GraphQLID? = nil, firstName: String? = nil, lastName: String? = nil, phoneNumber: String? = nil, profilePicUrl: String? = nil) {
    self.init(snapshot: ["__typename": "User", "id": id, "firstName": firstName, "lastName": lastName, "phoneNumber": phoneNumber, "profilePicUrl": profilePicUrl])
  }

  public var __typename: String {
    get {
      return snapshot["__typename"]! as! String
    }
    set {
      snapshot.updateValue(newValue, forKey: "__typename")
    }
  }

  public var id: GraphQLID? {
    get {
      return snapshot["id"]! as! GraphQLID?
    }
    set {
      snapshot.updateValue(newValue, forKey: "id")
    }
  }

  public var firstName: String? {
    get {
      return snapshot["first_name"]! as! String?
    }
    set {
      snapshot.updateValue(newValue, forKey: "first_name")
    }
  }

  public var lastName: String? {
    get {
      return snapshot["last_name"]! as! String?
    }
    set {
      snapshot.updateValue(newValue, forKey: "last_name")
    }
  }

  public var phoneNumber: String? {
    get {
      return snapshot["phone_number"]! as! String?
    }
    set {
      snapshot.updateValue(newValue, forKey: "phone_number")
    }
  }

  public var profilePicUrl: String? {
    get {
      return snapshot["profile_pic_url"]! as! String?
    }
    set {
      snapshot.updateValue(newValue, forKey: "profile_pic_url")
    }
  }
}

public struct HearerDetails: GraphQLFragment {
  public static let fragmentString =
    "fragment HearerDetails on User {" +
    "  __typename" +
    "  id" +
    "  first_name" +
    "  last_name" +
    "  phone_number" +
    "  profile_pic_url" +
    "}"

  public static let possibleTypes = ["User"]

  public static let selections: [Selection] = [
    Field("__typename", type: .nonNull(.scalar(String.self))),
    Field("id", type: .scalar(GraphQLID.self)),
    Field("first_name", type: .scalar(String.self)),
    Field("last_name", type: .scalar(String.self)),
    Field("phone_number", type: .scalar(String.self)),
    Field("profile_pic_url", type: .scalar(String.self)),
  ]

  public var snapshot: Snapshot

  public init(snapshot: Snapshot) {
    self.snapshot = snapshot
  }

  public init(id: GraphQLID? = nil, firstName: String? = nil, lastName: String? = nil, phoneNumber: String? = nil, profilePicUrl: String? = nil) {
    self.init(snapshot: ["__typename": "User", "id": id, "firstName": firstName, "lastName": lastName, "phoneNumber": phoneNumber, "profilePicUrl": profilePicUrl])
  }

  public var __typename: String {
    get {
      return snapshot["__typename"]! as! String
    }
    set {
      snapshot.updateValue(newValue, forKey: "__typename")
    }
  }

  public var id: GraphQLID? {
    get {
      return snapshot["id"]! as! GraphQLID?
    }
    set {
      snapshot.updateValue(newValue, forKey: "id")
    }
  }

  public var firstName: String? {
    get {
      return snapshot["first_name"]! as! String?
    }
    set {
      snapshot.updateValue(newValue, forKey: "first_name")
    }
  }

  public var lastName: String? {
    get {
      return snapshot["last_name"]! as! String?
    }
    set {
      snapshot.updateValue(newValue, forKey: "last_name")
    }
  }

  public var phoneNumber: String? {
    get {
      return snapshot["phone_number"]! as! String?
    }
    set {
      snapshot.updateValue(newValue, forKey: "phone_number")
    }
  }

  public var profilePicUrl: String? {
    get {
      return snapshot["profile_pic_url"]! as! String?
    }
    set {
      snapshot.updateValue(newValue, forKey: "profile_pic_url")
    }
  }
}