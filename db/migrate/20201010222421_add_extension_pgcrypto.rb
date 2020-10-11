# Enable the pgcrypto extention to enable the generation of random UUIDs for use as record primary keys.
class AddExtensionPgcrypto < ActiveRecord::Migration[6.0]
  def change
    enable_extension 'pgcrypto'
  end
end
