Product.destroy_all

50.times do |index|
  Product.create!(name: Faker::Food.ingredient,
                  cost: Faker::Number.decimal(l_digits: 2),
                  coo: Faker::Address.country_code_long)
end

p "Created #{Product.count} products"
