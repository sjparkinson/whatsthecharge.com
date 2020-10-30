class AddUniqueNullIndexToChargingRates < ActiveRecord::Migration[6.0]
  def change
    add_index :charging_rates, :rateable_id, unique: true, where: "ended_at IS NULL"
  end
end
