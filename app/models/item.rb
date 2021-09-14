class Item < ApplicationRecord
  belongs_to :shop
  has_one :temp_order
end
