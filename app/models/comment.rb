class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :contact
  validates :content, presence: true, length: { maximum: 300 }
end
