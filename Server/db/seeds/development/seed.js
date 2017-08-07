const usersData = require('../../../data/users')
const quotesData = require('../../../data/quotes')

exports.seed = (knex, Promise) => {
  return knex('hearings').del()
    .then(() => knex('quotes').del())
    .then(() => knex('users').del())
    .then(() => {
      return knex('users')
        .returning('id')
        .insert(usersData)
    })
    .then((userIds) => {
      const quoteObjects = quotesData.map(quote => {
        return transformQuote(quote, userIds)
      })
      return knex('quotes')
        .returning(['id', 'poster_id', 'sayer_id'])
        .insert(quoteObjects)
    })
    .then((quotes) => {
      const hearingsData = createHearingsData(quotes)
      return knex('hearings').insert(hearingsData)
    })
}

const createHearingsData = (quotes) => {
  let hearingsData = []
  quotes.map(quote => {
    numHearings = Math.floor(Math.random() * 4)
    const hearings = []
    if (quote.poster_id !== quote.sayer_id) {
      hearings.push({
        quote_id: quote.id,
        hearer_id: quote.hearer_id
      })
    }
    while (hearings.length < numHearings) {
      let hearerId = randomElement(quotes).poster_id
      while (hearerId === quote.sayer_id
          || hearerId === quote.poster_id) {
        hearerId = randomElement(quotes).poster_id
      }
      hearings.push({
        quote_id: quote.id,
        hearer_id: hearerId,
      })
    }
    hearingsData = hearingsData.concat(hearings)
  })
  return hearingsData
}

const transformQuote = (quote, userIds) => {
  return {
    poster_id: randomElement(userIds),
    sayer_id: randomElement(userIds),
    date: quote.date,
    content: quote.content,
    created_at: quote.created_at,
    updated_at: quote.updated_at,
  }
}

const randomElement = (array) => {
  const randNum = Math.random() * array.length
  const randIdx = Math.floor(randNum)
  return array[randIdx]
}
