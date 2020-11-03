require 'test_helper'

class MembershipPlanCostTest < ActiveSupport::TestCase
  def setup
    @membership_plan_cost =
      MembershipPlanCost.new(
        membership_plan: membership_plans(:polar_plus),
        cost_per_kwh: 0.39,
        cost_per_kwh_currency: 'GBP',
        ended_at: DateTime.now
      )
  end

  test 'should be valid' do
    assert @membership_plan_cost.valid?
  end

  test 'should return the current cost using the current scope' do
    assert_equal 1, MembershipPlanCost.current.size
    assert_equal membership_plan_costs(:current),
                 MembershipPlanCost.current.first
  end

  test 'should not be valid with no ended_at with existing current cost' do
    @membership_plan_cost.ended_at = nil

    assert_not @membership_plan_cost.valid?
    assert_includes @membership_plan_cost.errors.keys, :membership_plan

    assert_raises(ActiveRecord::RecordNotUnique) do
      @membership_plan_cost.save(validate: false)
    end
  end

  test 'should allow one of cost_per_kwh or cost_per_minute' do
    @membership_plan_cost.cost_per_kwh = nil
    @membership_plan_cost.cost_per_kwh_currency = nil

    assert_not @membership_plan_cost.valid?

    @membership_plan_cost.cost_per_kwh = 0.39
    @membership_plan_cost.cost_per_kwh_currency = 'GBP'

    assert @membership_plan_cost.valid?

    @membership_plan_cost.cost_per_kwh = nil
    @membership_plan_cost.cost_per_kwh_currency = nil
    @membership_plan_cost.cost_per_minute = 0.09
    @membership_plan_cost.cost_per_minute_currency = 'GBP'

    assert @membership_plan_cost.valid?

    @membership_plan_cost.cost_per_kwh = 0.39
    @membership_plan_cost.cost_per_kwh_currency = 'GBP'
    @membership_plan_cost.cost_per_minute = 0.09
    @membership_plan_cost.cost_per_minute_currency = 'GBP'

    assert_not @membership_plan_cost.valid?
  end
end
