class AddDiscountToCart < ActiveRecord::Migration[7.0]
  def change
    add_column :carts, :discount, :float, default: 0.0
  end
end
