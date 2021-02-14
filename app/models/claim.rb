class Claim < ApplicationRecord
  belongs_to :user

  attachment :receipt_img

  with_options on: :create do |create|
    create.validates :hospital_stay, :patient, :policy_number, :account_number, :destination, :illness, presence: true, length: { maximum: 50 }
    create.validates :account_number, presence: true, length: { maximum: 10 }
    create.validates :receipt_img, presence: true
  end

end
