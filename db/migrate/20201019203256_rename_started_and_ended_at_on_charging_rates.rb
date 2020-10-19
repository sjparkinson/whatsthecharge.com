class RenameStartedAndEndedAtOnChargingRates < ActiveRecord::Migration[6.0]
  def change
    remove_column :charging_rates, :begins_at, :timestamp
    remove_column :charging_rates, :ends_at, :timestamp

    add_column :charging_rates, :begins_at, :timestamp, precision: 6
    add_column :charging_rates, :ends_at, :timestamp, precision: 6
  end
end
