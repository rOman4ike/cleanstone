class Product < ApplicationRecord
  AVAILABLE_IMAGE_CONTENT_TYPES = [
    'image/png',
    'image/jpe',
    'image/jpeg'
  ]

  has_one_attached :image
  has_many :cart_items,
    dependent: :destroy

  validates :image,
    attached: true,
    content_type: AVAILABLE_IMAGE_CONTENT_TYPES

  validates :name,
    presence: true
end

# == Schema Information
#
# Table name: products
#
#  id         :integer          not null, primary key
#  name       :string
#  price      :float
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
