class TripItem < ApplicationRecord
  belongs_to :trip
  belongs_to :item

  validates :item_id, uniqueness: { scope: :trip_id }
end
