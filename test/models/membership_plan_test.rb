require 'test_helper'

class MembershipPlanTest < ActiveSupport::TestCase
  def setup
    @plan = MembershipPlan.new(
      name: 'Polar Plus',
      description: 'TBC',
      network: networks(:polar_plus),
      cost: 7.85,
      cost_currency: 'GBP',
      cost_frequency: :monthly
    )
  end

  test 'should be valid' do
    assert @plan.valid?
  end
end
