class Product < ApplicationRecord
  has_one_attached :image
  has_many :cart_items,
    dependent: :destroy
end

# == Schema Information
#
# Table name: products
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  price      :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
