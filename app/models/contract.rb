class Contract < ApplicationRecord
  belongs_to :user
  validates :contract_name,:policy_number, presence: true, length: { maximum: 15 }
end
