class MembershipPlan < ApplicationRecord
  validates :name, presence: true

  enum cost_frequency: {
         once: 0, annually: 1, quarterly: 2, monthly: 3, weekly: 4
       },
       _prefix: true

  belongs_to :network
  has_many :membership_plan_costs, dependent: :destroy
  has_one :current_membership_plan_cost,
          -> { current },
          class_name: MembershipPlanCost.name

  def cost_formatted
    # This assumes currency subunit is always 100, okay for EUR and GBPt ad.
    Money.new(cost * 100, cost_currency).format
  end
end
