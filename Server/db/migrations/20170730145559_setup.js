exports.up = (knex, Promise) => {
  return Promise.all([
    knex.schema.createTable('users', (table) => {
      table.increments('id').primary()
      table.string('phone_number')
      table.string('first_name')
      table.string('last_name')
      table.string('password_digest')
      table.string('session_token')
      table.string('profile_pic_url')
      table.timestamps()
    }),

    knex.schema.createTable('quotes', (table) => {
      table.increments('id').primary()
      table.integer('sayer_id')
      table.integer('poster_id')
      table.string('content')
      table.date('date')
      table.timestamps()
    }),

    knex.schema.createTable('hearings', (table) => {
      table.increments('id').primary()
      table.integer('quote_id').unsigned()
        .references('quotes.id')
      table.integer('hearer_id').unsigned()
        .references('users.id')
      table.timestamps()
    })
  ])
}

exports.down = (knex, Promise) => {
  return Promise.all([
    knex.schema.dropTable('hearings'),
    knex.schema.dropTable('quotes'),
    knex.schema.dropTable('users'),
  ])
}
