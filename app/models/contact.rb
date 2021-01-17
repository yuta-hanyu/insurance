class Contact < ApplicationRecord
  belongs_to :user
  validates :type,:title,:content,:tel, presence: true, length: { maximum: 500 }
end
