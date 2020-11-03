class PaygPlan < ApplicationRecord
  validates_presence_of :name
  validates_presence_of :description
  validates_presence_of :network

  validates_uniqueness_of :plan_url, allow_nil: true

  belongs_to :network
  has_many :payg_plan_costs, dependent: :destroy
  has_one :current_payg_plan_cost, -> { current }, class_name: PaygPlanCost.name
end
