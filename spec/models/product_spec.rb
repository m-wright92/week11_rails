require 'rails_helper'

describe Product do
  it { should have_many :reviews }
  it { should validate_presence_of :name }
  it { should validate_presence_of :coo }
  it { should validate_presence_of :cost }
  describe '.titleize_product' do
    it "titleizes the name of a product" do
      product = Product.create({name: "big huge shoes", coo: "usa", cost: 15})
      expect(product.name).to(eq("Big Huge Shoes"))
    end
  end
  describe '.coo_upcase' do
    it "upcases the coo before save" do
      product = Product.create({name: "big huge shoes", coo: "usa", cost: 15})
      expect(product.coo).to(eq("USA"))
    end
  end
  describe '.most_reviews' do
    it "returns the most reviewed product" do
      product = Product.create({name: "big huge shoes", coo: "usa", cost: 15, id: nil})
      product.save
      product2 = Product.create({name: "little tiny shoes", coo: "usa", cost: 15, id: nil})
      product2.save
      review = Review.create({author: "mike", content_body: "abcdefighijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyz", rating: 3, product_id: product.id})
      expect(Product.most_reviews).to(eq([product]))
    end
  end
  describe '.three_recent' do
    it "returns three most recently added products" do
      product = Product.create({name: "big huge shoes", coo: "usa", cost: 15, id: nil})
      product.save
      product2 = Product.create({name: "little tiny shoes", coo: "usa", cost: 15, id: nil})
      product2.save
      product3 = Product.create({name: "ordinarily regular shoes", coo: "usa", cost: 15, id: nil})
      product3.save
      expect(Product.three_recent).to(eq([product3, product2, product]))
    end
  end
end