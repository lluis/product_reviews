class Product < ApplicationRecord
  has_many :reviews, dependent: :destroy

  validates :name, presence: true

  def rating
    return 0 if reviews.blank?
    (reviews.sum(:rating).to_f / reviews.count).round
  end
end
