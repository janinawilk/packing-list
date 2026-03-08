class Item < ApplicationRecord
  belongs_to :category
  has_many :item_tags, dependent: :destroy
  has_many :tags, through: :item_tags
  has_many :trip_items, dependent: :destroy
  has_many :trips, through: :trip_items

  validates :name, presence: true
end
