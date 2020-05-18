# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Tag.find_or_create_by(
    name: "tag_seed"
)

Form.find_or_create_by(
    name: "form_seed",
    tag: Tag.first
)

Customer.find_or_create_by(
    name: "customer_seed",
    email: "email@seed.com",
    form: Form.first
)

count = 0
loop do
  count += 1
  Customer.find_or_create_by(
      name: "customer_seed",
      email: "email#{count}@seed.com",
      form: Form.first
  )
  break if count > 30
end

