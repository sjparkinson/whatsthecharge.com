require 'test_helper'

class CountryTest < ActiveSupport::TestCase
  test 'should save a valid country' do
    country = Country.new
    country.name = 'Germany'
    country.countryCode = 'de'

    assert country.valid?
  end

  test 'should not save country without :name' do
    country = Country.new(name: nil)

    assert_not country.valid?
    assert_includes country.errors.keys, :name
  end

  test 'should not save country without valid :countryCode' do
    country = Country.new(countryCode: nil)

    assert_not country.valid?
    assert_includes country.errors.keys, :countryCode
  end
end
