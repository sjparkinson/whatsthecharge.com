class PaygPlanCost < ApplicationRecord
  validates :payg_plan,
            uniqueness: {
              conditions: -> { where ended_at: nil }, unless: :ended_at?
            }

  validate :require_cost_per_kwh_or_minute

  belongs_to :payg_plan

  scope :current, -> { where ended_at: nil }

  private

  def require_cost_per_kwh_or_minute
    unless !!cost_per_kwh ^ !!cost_per_minute
      errors[:base] << 'Specify either a cost per kWh or cost per minute'
    end
  end
end
