class Contact < ApplicationRecord
  belongs_to :user
  validates :type, :title, :content,  presence: true, length: { maximum: 500 }
  self.inheritance_column = :_type_disabled
  
  has_many :comments, dependent: :destroy
  
end
