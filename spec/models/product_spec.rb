require 'rails_helper'

describe Product do
  it { should have_many :reviews }
  it { should validate_presence_of :name }
  it { should validate_presence_of :coo }
  it { should validate_presence_of :cost }
  it("titleizes the name of a product") do
    product = Product.create({name: "big huge shoes", coo: "usa", cost: 15})
    expect(product.name).to(eq("Big Huge Shoes"))
  end
end