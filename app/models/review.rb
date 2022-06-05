# frozen_string_literal: true

class Review < ApplicationRecord
  belongs_to :product
  validates :author, presence: true
  validates :content_body, presence: true
  validates_length_of :content_body, minimum: 50, maximum: 250
  validates :rating, presence: true
  validates :rating, inclusion: { in: 1..5 }
end
