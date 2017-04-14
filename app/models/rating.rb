class Rating < ActiveRecord::Base
  belongs_to :product
  belongs_to :user

  validates :rating, numericality: { minimum: 1, maximum: 5 }
  validates :description, presence: true
end
