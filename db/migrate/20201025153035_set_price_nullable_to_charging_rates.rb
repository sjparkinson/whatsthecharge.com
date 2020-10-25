class SetPriceNullableToChargingRates < ActiveRecord::Migration[6.0]
  def change
    change_column_null :charging_rates, :price_per_kwh, true
    change_column_null :charging_rates, :price_per_kwh_currency, true
    change_column_null :charging_rates, :price_per_minute, true
    change_column_null :charging_rates, :price_per_minute_currency, true
  end
end
