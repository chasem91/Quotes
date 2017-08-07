const express = require('express')
const bodyParser = require('body-parser')
const { graphqlExpress, graphiqlExpress } = require('apollo-server-express')
const myGraphQLSchema = require('./graphql/schema')
const morganBody = require('morgan-body')

const PORT = 3000

var app = express()

morganBody(app)

app.use(
  '/graphql',
  bodyParser.json(),
  graphqlExpress({ schema: myGraphQLSchema })
)

app.use('/graphiql', graphiqlExpress({
  endpointURL: '/graphql',
}));

app.listen(PORT)

module.exports = app
