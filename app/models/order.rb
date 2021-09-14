class Order < ApplicationRecord
  has_many :temp_orders

  validates :total_price, numericality: { greater_than: 0 }

  def save_with_update_temp_orders!(temp_orders)
    ActiveRecord::Base.transaction do
      temp_orders.each { |temp| temp.update!(active: false, order: self) }
      self.total_price = -100
      self.save!
    end
  end
end
