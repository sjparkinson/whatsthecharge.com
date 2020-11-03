class MembershipPlan < ApplicationRecord
  validates_presence_of :name

  validates_uniqueness_of :plan_url, allow_nil: true

  enum cost_frequency: {
         once: 0, annually: 1, quarterly: 2, monthly: 3, weekly: 4
       },
       _prefix: true

  belongs_to :network
  has_many :membership_plan_costs
  has_one :current_membership_plan_cost,
          -> { current },
          class_name: MembershipPlanCost.name
end
