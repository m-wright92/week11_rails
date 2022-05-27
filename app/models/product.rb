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
  scope :usa, -> { where(coo: "USA") }
  validates :name, presence: true
  validates :coo, presence: true
  validates_length_of :coo, is: 3
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