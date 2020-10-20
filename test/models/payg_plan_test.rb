require 'test_helper'

class PaygPlanTest < ActiveSupport::TestCase
  test 'should save a valid pay as you go plan' do
    payg_plan = PaygPlan.new
    payg_plan.name = 'DirectAccess'
    payg_plan.description = 'Some amazing description...'
    payg_plan.network = networks(:polar_instant)

    assert payg_plan.valid?
  end

  test 'should not save without :name' do
    payg_plan = PaygPlan.new(name: nil)

    assert_not payg_plan.valid?
    assert_includes payg_plan.errors.keys, :name
  end

  test 'should not save without :description' do
    payg_plan = PaygPlan.new(description: nil)

    assert_not payg_plan.valid?
    assert_includes payg_plan.errors.keys, :description
  end

  test 'should not save without :network' do
    payg_plan = PaygPlan.new(network: nil)

    assert_not payg_plan.valid?
    assert_includes payg_plan.errors.keys, :network
  end

  test 'should convert blank :plan_url to nil' do
    payg_plan = PaygPlan.new(plan_url: '')

    payg_plan.valid?

    assert_nil payg_plan.plan_url
    assert_not_includes payg_plan.errors.keys, :plan_url
  end
end
