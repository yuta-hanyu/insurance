class Contract < ApplicationRecord
  belongs_to :user
  validates :contract_name, presence: true, length: { maximum: 15 }
  validates :policy_number, presence: true, length: { maximum: 10 }
end
