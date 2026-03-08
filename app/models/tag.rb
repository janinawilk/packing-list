class Tag < ApplicationRecord
  has_many :item_tags, dependent: :destroy
  has_many :items, through: :item_tags
  has_many :trip_filters, dependent: :destroy

  validates :name, presence: true, uniqueness: true
end
