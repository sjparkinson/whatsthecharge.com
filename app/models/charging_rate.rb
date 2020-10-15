class ChargingRate < ApplicationRecord
  belongs_to :rateable, polymorphic: true
end
