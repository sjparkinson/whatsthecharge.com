class AddAppUrlsToNetworks < ActiveRecord::Migration[6.0]
  def change
    add_column :networks, :android_app_id, :string
    add_column :networks, :ios_app_id, :string

    add_index :networks, :android_app_id, unique: true
    add_index :networks, :ios_app_id, unique: true
  end
end
