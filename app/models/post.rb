class Post < ApplicationRecord
  belongs_to :user
  has_many :likes,dependent: :destroy
  has_many :likeings, through: :likes, source: :user
  attachment :post_img
  
  with_options on: :confirm do |confirm|
    confirm.validates :content,:title, presence: true, length: { maximum: 255 }
  end
  
  with_options on: :create do |create|
    create.validates :content,:title, presence: true, length: { maximum: 255 }
    create.validates :post_img, presence: true
  end
end
