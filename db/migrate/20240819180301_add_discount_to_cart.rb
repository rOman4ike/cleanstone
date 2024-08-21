class AddDiscountToCart < ActiveRecord::Migration[7.0]
  def change
    add_column :carts, :discount, :integer, default: 0
  end
end
