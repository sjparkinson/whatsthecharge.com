class CreateChargingRates < ActiveRecord::Migration[6.0]
  def change
    create_table :charging_rates, id: :uuid, comment: 'Costs by charging speed for membership and pay-as-you-go plans.' do |t|
      t.references :rateable, type: :uuid, polymorphic: true

      t.text :description

      t.monetize :price_per_kwh, null: false, comment: 'Cost per kWh for this charging speed.'
      t.monetize :price_per_minute, null: false, comment: 'Cost per minute for this charging speed.'

      t.string :currency, null: false, comment: 'ISO 4217 three character currency code.'

      t.integer :charging_rates, array: true, comment: 'Charging speeds supported by this rate in kWh, e.g. 7, 22, and 50.'

      t.index :charging_rates, using: 'gin'

      t.datetime :begins_at, comment: 'When this charging rate becomes available.'
      t.datetime :ends_at, comment: 'When this charging rate becomes unavailable.'

      t.timestamps
    end
  end
end
