class Shop < ApplicationRecord
  has_many :items
  has_many :temp_orders, through: :items

  validates :name, presence: true, length: { maximum: 30 }
end
