class Product < ApplicationRecord
  scope :most_reviews, -> { }
  has_many :reviews, dependent: :destroy
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
endgit