class CreateCountries < ActiveRecord::Migration[6.0]
  def change
    create_table :countries, id: :uuid, comment: 'Supported countries.' do |t|
      t.string :name, null: false
      t.string :countryCode,
               null: false,
               description:
                 'Lowercase ISO 3166-1 alpha-2 two letter country code.'

      t.timestamps

      t.index :countryCode, unique: true
    end
  end
end
