# Configure Rails to use UUIDs for record primary keys.
Rails.application.config.generators do |g|
  g.orm :active_record, primary_key_type: :uuid
end
