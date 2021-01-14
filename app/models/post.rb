class Post < ApplicationRecord
  belongs_to :user
  has_many :likes,dependent: :destroy
  has_many :likeings, through: :likes, source: :user
  mount_uploader :image, ImageUploader
  
  with_options on: :confirm do |confirm|
    confirm.validates :content,:title, presence: true, length: { maximum: 255 }
  end
  
  with_options on: :create do |create|
    create.validates :content,:title, presence: true, length: { maximum: 255 }
    create.validates :image, presence: true
  end
end
