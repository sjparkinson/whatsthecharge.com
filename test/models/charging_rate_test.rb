require 'test_helper'

class ChargingRateTest < ActiveSupport::TestCase
  def setup
    @plan = payg_plans(:polar_instant_payg)

    @charging_rate = ChargingRate.new(
      rateable: @plan,
      price_per_kwh: 0.39,
      price_per_kwh_currency: 'GBP',
      supported_charging_speeds: [7, 11, 22]
    )
  end

  test 'should be valid' do
    assert @charging_rate.valid?
  end

  test 'should only allow one active charging rate per rateable' do
    @charging_rate.save

    # With no ended_at should not be valid
    old_charging_rate = ChargingRate.new(
      rateable: @plan,
      price_per_kwh: 0.45,
      price_per_kwh_currency: 'GBP',
      supported_charging_speeds: [7, 11, 22]
    )

    assert_not old_charging_rate.valid?
    assert_includes old_charging_rate.errors.keys, :rateable_id

    assert_raises(ActiveRecord::RecordNotUnique) do
      old_charging_rate.save(validate: false)
    end
  end

  test 'should allow many inactive charing rate per rateable' do
    @charging_rate.save

    old_charging_rate = ChargingRate.new(
      rateable: @plan,
      price_per_kwh: 0.45,
      price_per_kwh_currency: 'GBP',
      supported_charging_speeds: [7, 11, 22],
      ended_at: DateTime.now
    )

    assert old_charging_rate.valid?
    assert old_charging_rate.save
  end
end
