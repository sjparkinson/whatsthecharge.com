class DropTableChargingRates < ActiveRecord::Migration[6.0]
  def up
    drop_table :charging_rates
  end
end
