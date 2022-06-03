Product.destroy_all

50.times do |index|
  Product.create!(name: Faker::Food.ingredient,
                  cost: Faker::Commerce.price(range: 0..20.0, as_string: true),
                  coo: Faker::Address.country_code_long)
end

p "Created #{Product.count} products"
