class CreateNetworks < ActiveRecord::Migration[6.0]
  def change
    create_table :networks, id: :uuid do |t|
      t.string :name, null: false
      t.text :description

      t.string :slug, null: false, description: 'URL and human friendly name to use for routing.'
      t.string :link, null: false, description: 'URL to link to the networks website.'

      t.belongs_to :country, type: :uuid, foreign_key: true, index: true

      t.timestamps

      t.index :slug, unique: true
    end
  end
end
