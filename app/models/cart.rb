class Cart < ApplicationRecord
  has_many :cart_items,
    dependent: :destroy
  has_many :products,
    through: :cart_items

  def total_cart_items
    cart_items.map(&:quantity).sum
  end

  def total_price
    cart_items.map do |cart_item|
      cart_item.product.price * cart_item.quantity
    end.sum
  end

  def total_price_with_discount
    total_price - discount < 0 ? 0 : total_price - discount
  end
end

# == Schema Information
#
# Table name: carts
#
#  id         :integer          not null, primary key
#  discount   :integer          default(0)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
