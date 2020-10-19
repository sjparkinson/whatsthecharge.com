class PaygPlan < ApplicationRecord
  validates_presence_of :name
  validates_presence_of :description
  validates_presence_of :network

  belongs_to :network
  has_many :charging_rates, as: :rateable
end
