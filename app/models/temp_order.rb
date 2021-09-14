class TempOrder < ApplicationRecord
  belongs_to :shop
  belongs_to :item
  belongs_to :order, optional: true

  validates :quantity, numericality: { greater_than: 0 }

  scope :active, -> { where(active: true) }
  scope :other_shop, -> (shop_id) { where.not(shop_id: shop_id) }

  def total_amount
    item.price * quantity
  end
end
