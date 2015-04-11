class Review < ActiveRecord::Base
  belongs_to :product
  belongs_to :user

  validates :rating , presence: true
  validates :content, presence: true
  validates :user_id, presence: true 
  #test pasess, but according to http://guides.rubyonrails.org/active_record_validations.html#validates-associated should be:
  # valideates :user, presence: true
end
