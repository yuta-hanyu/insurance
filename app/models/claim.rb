class Claim < ApplicationRecord
  belongs_to :user

  attachment :receipt_img
  
  with_options on: :confirm do |confirm|
    confirm.validates :hospital_stay,:patient,:policy_number,:account_number,:destination,:illness, presence: true, length: { maximum: 50 }
  end
  
  with_options on: :create do |create|
    create.validates :hospital_stay,:patient,:policy_number,:account_number,:destination,:illness, presence: true, length: { maximum: 50 }
    create.validates :receipt_img, presence: true
  end

end
