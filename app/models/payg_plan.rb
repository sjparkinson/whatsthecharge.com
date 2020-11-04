class PaygPlan < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true
  validates :network, presence: true

  belongs_to :network
  has_many :payg_plan_costs, dependent: :destroy
  has_one :current_payg_plan_cost, -> { current }, class_name: PaygPlanCost.name
end
