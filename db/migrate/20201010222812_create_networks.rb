class CreateNetworks < ActiveRecord::Migration[6.0]
  def change
    create_table :networks, id: :uuid do |t|
      t.string :name, null: false
      t.text :description

      t.string :slug, null: false, description: 'URL and human friendly name to use for routing.'
      t.string :website_url, null: false, description: 'URL to link to the network\'s website.'
      t.string :pricing_url, description: 'URL to the network\'s pricing information.'

      t.belongs_to :country, type: :uuid, foreign_key: true, index: true

      t.timestamps

      t.index :slug
    end
  end
end
