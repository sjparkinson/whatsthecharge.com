class MembershipPlan < ApplicationRecord
  validates :name, presence: true
  validates :currency, format: { with: /\A[a-z]{3}\z/ }, presence: true

  monetize :price_one_off_cents, with_model_currency: :currency, allow_nil: true
  monetize :price_per_month_cents, with_model_currency: :currency, allow_nil: true

  belongs_to :network
  has_many :charging_rates, as: :rateable
end
