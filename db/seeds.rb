# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

100.times do |n|
    Item.create!(
        product_name: Faker::Commerce.product_name,
        product_image: '',
        price: Faker::Commerce.price,
        description: Faker::Lorem.sentence(word_count: 20),
        hidden: false,
        priority: n
    )
end

# t.string :product_name
# t.text :product_image
# t.integer :price
# t.string :description
# t.boolean :hidden
# t.integer :priority