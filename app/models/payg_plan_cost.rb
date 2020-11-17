class PaygPlanCost < ApplicationRecord
  validates :payg_plan,
            uniqueness: {
              conditions: -> { where ended_at: nil }, unless: :ended_at?
            }

  validate :require_cost_per_kwh_or_minute

  belongs_to :payg_plan

  scope :current, -> { where ended_at: nil }

  def cost_formatted
    # This assumes currency subunit is always 100, okay for EUR and GBPt ad.
    return "#{Money.new(cost_per_kwh * 100, cost_per_kwh_currency).format} per kWh" if cost_per_kwh.present?
    return "#{Money.new(cost_per_minute * 100, cost_per_minute_currency).format} per minute" if cost_per_minute.present?
  end

  private

  def require_cost_per_kwh_or_minute
    unless !!cost_per_kwh ^ !!cost_per_minute
      errors[:base] << 'Specify either a cost per kWh or cost per minute'
    end
  end
end
