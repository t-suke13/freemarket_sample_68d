# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'csv'

CSV.foreach('db/sample_data/brands.csv', headers: true) do |row|
  Brand.create(
    id: row['id'],
    name: row['name']
  )
end

CSV.foreach('db/sample_data/categories.csv', headers: true) do |row|
  Category.create(
    id: row['id'],
    name: row['name'],
    ancestry: row['ancestry']
  )
end

# CSV.foreach('db/sample_data/users.csv', headers: true) do |row|
#   User.create(
#     id: row['id'],
#     nickname: row['nickname'],
#     first_name: row['first_name'],
#     last_name: row['last_name'],
#     first_furigana: row['first_furigana'],
#     last_furigana: row['last_furigana'],
#     birthday: row['birthday'],
#     email: row['email'],
#     password: row['password']
#   )
# end



# CSV.foreach('db/sample_data/address.csv', headers: true) do |row|
#   Address.create(
#     id: row['id'],
#     postal_code: row['postal_code'],
#     prefecture_id: row['prefecture_id'],
#     address1: row['address1'],
#     address2: row['address2'],
#     building_name: row['building_name'],
#     phone_number: row['phone_number'],
#     user_id: row['user_id']
#   )
# end

# CSV.foreach('db/sample_data/credit_cards.csv', headers: true) do |row|
#   CreditCard.create(
#     id: row['id'],
#     customer_id: row['customer_id'],
#     card_id: row['card_id'],
#     user_id: row['user_id']
#   )
# end

# CSV.foreach('db/sample_data/items.csv', headers: true) do |row|
#   Item.create(
#     id: row['id'],
#     name: row['name'],
#     description: row['description'],
#     price: row['price'],
#     stock_status: row['stock_status'],
#     condition_id: row['condition_id'],
#     shipping_fee_who_id: row['shipping_fee_who_id'],
#     prefecture_id: row['prefecture_id'],
#     shipping_days_id: row['shipping_days_id'],
#     user_id: row['user_id'],
#     brand_id: row['brand_id'],
#     category_id: row['category_id']
#   )
# end

# CSV.foreach('db/sample_data/orders.csv', headers: true) do |row|
#   Order.create(
#     id: row['id'],
#     user_id: row['user_id:'],
#     item_id: row['item_id']
#   )
# end

# CSV.foreach('db/sample_data/item_images.csv', headers: true) do |row|
#   ItemImage.create(
#     id: row['id'],
#     url: row['url'],
#     item_id: row['item_id']
#   )
# end