class Product < ApplicationRecord
  has_many :reviews, dependent: :destroy
  scope :most_reviews, -> {(
    select("products.id, products.name, products.coo, count(reviews.id) as reviews_count")
    .joins(:reviews)
    .group("products.id")
    .order("reviews_count DESC")
    .limit(1)
  )}
  scope :three_recent, -> { order(created_at: :desc).limit(3)}
  validates :name, presence: true
  validates :coo, presence: true
  validates :cost, presence: true
  before_save :titleize_product, :coo_upcase

  private
  def titleize_product
    self.name = self.name.titleize
  end

  def coo_upcase
    self.coo = self.coo.upcase
  end
end