class RenameEndsAtOnChargingRate < ActiveRecord::Migration[6.0]
  def change
    rename_column :charging_rates, :ends_at, :ended_at
  end
end
