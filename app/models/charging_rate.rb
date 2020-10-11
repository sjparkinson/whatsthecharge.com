class ChargingRate < ApplicationRecord
  belongs_to :rateable, polymorphic: true

  monetize :price_per_kwh_cents, with_model_currency: :currency, allow_nil: true
  monetize :price_per_minute_cents, with_model_currency: :currency, allow_nil: true
end
