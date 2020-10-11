class PaygPlan < ApplicationRecord
  belongs_to :network
  has_many :charging_rates, as: :rateable
end
