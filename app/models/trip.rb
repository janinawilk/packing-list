class Trip < ApplicationRecord
  has_many :trip_items, dependent: :destroy
  has_many :items, through: :trip_items
  has_many :trip_filters, dependent: :destroy
  has_many :tags, through: :trip_filters

  validates :name, presence: true
end
