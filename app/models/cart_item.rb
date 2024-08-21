class CartItem < ApplicationRecord
  belongs_to :cart
  belongs_to :product

  after_update :check_quantity

  def total_price
    product.price * quantity
  end

  private

  def check_quantity
    if quantity <= 0
      self.destroy
    end
  end
end

# TODO: переименовать quantity в count

# == Schema Information
#
# Table name: cart_items
#
#  id         :integer          not null, primary key
#  quantity   :integer          default(1)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  cart_id    :integer          not null
#  product_id :integer          not null
#
# Indexes
#
#  index_cart_items_on_cart_id     (cart_id)
#  index_cart_items_on_product_id  (product_id)
#
# Foreign Keys
#
#  cart_id     (cart_id => carts.id)
#  product_id  (product_id => products.id)
#
