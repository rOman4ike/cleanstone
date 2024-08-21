cart = Cart.create(discount: 400)

products = Product.create([
  {
    name: 'Беспроводная колонка Goodyear Bluetooth Speaker',
    price: rand(800..2000)
  },
  {
    name: 'Женский домашний костюм Sweet Dreams',
    price: rand(800..2000)
  },
  {
    name: 'Плащ-дождевик SwissOak',
    price: rand(800..2000)
  }
])

products.each_with_index do |product, index|
  image_name = "image-#{index + 1}.png"
  product.image.attach(
    io: File.open(Rails.root.join("db/images/#{image_name}")),
    filename: image_name
  )
  product.save
  CartItem.create(cart_id: cart.id, product_id: product.id)
end
