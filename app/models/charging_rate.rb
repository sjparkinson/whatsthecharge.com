class ChargingRate < ApplicationRecord
  validates_uniqueness_of :rateable_id, conditions: -> { where(ended_at: nil) }, unless: :ended_at?

  belongs_to :rateable, polymorphic: true
end
