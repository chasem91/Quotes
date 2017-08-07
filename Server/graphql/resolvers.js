const knex = require('../db/knex')

module.exports = {
  Query: {
    users(obj, args, context, info) {
      return knex('users').select()
    },
    quotes(obj, args, context, info) {
      return knex('quotes').select()
    },
    hearings(obj, args, context, info) {
      return knex('hearings').select()
    },
    user(obj, args, context, info) {
      return knex('users').first().where('id', '=', args.id)
    }
  },
  Mutation: {
    create_quote(obj, args, context, info) {
      const { content, hearer_phone_numbers, sayer_phone_number, poster_id } = args.quote_data
      
      let sayerId
      return knex('users')
        .select('id')
        .first()
        .where({ phone_number: sayer_phone_number })
        .then((found) => {
          if (found) {
            return found
          } else {
            return knex('users')
              .insert({ phone_number: sayer_phone_number }, ['id'])
              .then(res => res[0])
          }
        })
        .then(({ id }) => {
          sayerId = id
        })
        .then(() => {
          const promises = []
          hearer_phone_numbers.forEach(num => {
            promises.push(new Promise((resolve, reject) => {
              knex('users')
                .select('id')
                .first()
                .where({ phone_number: num })
                .then((found) => {
                  if (found) {
                    return found
                  } else {
                    return knex('users')
                      .insert({ phone_number: num }, ['id'])
                      .then(res => res[0])
                  }
                })
                .then(({ id }) => resolve(id))
            }))
          })
          return Promise.all(promises)
        })
        .then(hearerIds => {
          console.log('poster_id', poster_id)
          return knex('quotes').insert({
            poster_id: poster_id,
            sayer_id: sayerId,
            content: content,
          }, ['id'])
          .then(res => res[0])
          .then(({ id: quoteId }) => {
            hearerIds.push(Number(poster_id))
            return knex('hearings').insert(hearerIds.map(id => {
              return { quote_id: quoteId, hearer_id: id }
            }))
            .then(() => {
              return knex('quotes').first().where('id', quoteId)
            })
          })
        })
    }
  },
  User: {
    posted_quotes(obj, args, context, info) {
      return knex('quotes').where('poster_id', '=', obj.id)
    },
    heard_quotes(obj, args, context, info) {
      return knex('hearings')
        .where('hearer_id', '=', obj.id)
        .select('quote_id')
        .then(result => {
          return knex('quotes')
            .whereIn('id', result.map(r => r.quote_id))
        })
    },
    said_quotes(obj, args, context, info) {
      return knex('quotes')
        .where('sayer_id', '=', obj.id)
    }
  },
  Quote: {
    hearers(obj, args, context, info) {
      return knex('hearings')
        .where('quote_id', '=', obj.id)
        .select('hearer_id')
        .then(result => {
          return knex('users')
            .whereIn('id', result.map(r => r.hearer_id))
        })
    },
    sayer(obj, args, context, info) {
      return knex('users').first().where('id', '=', obj.sayer_id)
    },
    poster(obj, args, context, info) {
      return knex('users').first().where('id', '=', obj.poster_id)
    }
  },
}
