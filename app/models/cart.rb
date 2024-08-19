class Cart < ApplicationRecord
  has_many :cart_items,
    dependent: :destroy
end

# == Schema Information
#
# Table name: carts
#
#  id         :integer          not null, primary key
#  discount   :float            default(0.0)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
