const faker = require('faker')

module.exports = [...Array(200)].map(() => {
  return {
    content: faker.lorem.sentence(),
    date: faker.date.past(),
    created_at: new Date(),
    updated_at: new Date(),
  }
})
