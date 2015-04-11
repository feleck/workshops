class Product < ActiveRecord::Base
  belongs_to :category
  belongs_to :user
  has_many :reviews

  validates :price, presence: true
  validates :title, presence: true
  validates :description, presence: true
  validates :price, format: { with: /\A\d+.?\d{,2}?\z/ }

  def average_rating
    ratings = self.reviews.all.collect { |review| review.rating }
    ratings.inject { |sum, rating| sum + rating }.to_f / ratings.size
  end

end
