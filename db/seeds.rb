Product.destroy_all

50.times do |index|
  Product.create!(name: Faker::Food.ingredient,
                  cost: Faker::Commerce.price(range: 0..20.0, as_string: true),
                  coo: Faker::Address.country_code_long)
end

p "Created #{Product.count} products"

Review.destroy_all

250.times do |index|
  Review.create!(author: Faker::GreekPhilosophers.name,
                content_body: Faker::Lorem.paragraph_by_chars(number: 50..250, supplemental: false),
                rating: Faker::Number.between(from: 1, to: 5),
                product_id: )
end

params = { product: { name: Faker::Food.ingredient, }}