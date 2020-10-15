class MembershipPlan < ApplicationRecord
  validates :name, presence: true
  validates :currency, format: { with: /\A[a-z]{3}\z/ }, presence: true

  belongs_to :network
  has_many :charging_rates, as: :rateable
end
