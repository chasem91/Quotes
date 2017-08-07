module.exports = `
  type User {
    id: ID
    phone_number: String
    first_name: String
    last_name: String
    password_digest: String
    session_token: String
    profile_pic_url: String
    posted_quotes: [Quote]
    said_quotes: [Quote]
    heard_quotes: [Quote]
  }
  type Quote {
    id: ID
    content: String
    sayer: User
    sayer_id: ID
    poster: User
    poster_id: ID
    date: String
    hearers: [User]
  }
  type Hearing {
    id: ID!
    quote_id: ID
    user_id: ID
    quote: Quote
    hearer: User
  }
  # the schema allows the following query:
  type Query {
    users: [User]
    quotes: [Quote]
    hearings: [Hearing]
    user(id: ID): User
  }
  input QuoteData {
    content: String
    hearer_phone_numbers: [String]
    sayer_phone_number: String
    poster_id: ID
    date: String
  }
  type Mutation {
    create_quote(quote_data: QuoteData): Quote
  }
  schema {
    query: Query
    mutation: Mutation
  }
`
