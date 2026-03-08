class TripFilter < ApplicationRecord
  belongs_to :trip
  belongs_to :tag

  validates :tag_id, uniqueness: { scope: :trip_id }
end
