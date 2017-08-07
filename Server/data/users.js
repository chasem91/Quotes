const faker = require('faker')

module.exports = [...Array(30)].map(() => {
  return {
    first_name: faker.name.firstName(),
    last_name: faker.name.lastName(),
    phone_number: faker.phone.phoneNumber(),
    profile_pic_url: 'http://lorempixel.com/200/200/',
    created_at: new Date(),
    updated_at: new Date(),
  }
})
