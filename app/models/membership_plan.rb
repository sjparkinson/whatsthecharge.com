class MembershipPlan < ApplicationRecord
  validates_presence_of :name

  validates_uniqueness_of :plan_url, allow_nil: true

  belongs_to :network
  has_many :charging_rates, as: :rateable
end
