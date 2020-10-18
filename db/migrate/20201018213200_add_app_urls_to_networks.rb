class AddAppUrlsToNetworks < ActiveRecord::Migration[6.0]
  def change
    add_column :networks, :android_app_url, :string
    add_column :networks, :ios_app_url, :string
  end
end
