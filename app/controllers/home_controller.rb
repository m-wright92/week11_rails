class HomeController < ApplicationController
  def index
    @products = Product.all
    @three_recent = Product.three_recent
    @usa = Product.usa
    @most_reviews = Product.most_reviews
    render :index
  end
end