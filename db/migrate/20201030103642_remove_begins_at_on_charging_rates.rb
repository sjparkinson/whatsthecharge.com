class RemoveBeginsAtOnChargingRates < ActiveRecord::Migration[6.0]
  def change
    remove_column :charging_rates, :begins_at, :datetime
  end
end
