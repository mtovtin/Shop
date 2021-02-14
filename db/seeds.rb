30.times do
  product = Product.create({
                             name: Faker::Food.dish,
                             description: Faker::Food.description,
                             price: rand(100)
                           })
  product.image.attach(io: URI.open('https://picsum.photos/300'), filename: "#{product.name}.jpg",
                       content_type: 'image/jpg')
end
