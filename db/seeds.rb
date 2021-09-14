(1..3).each do |n|
  shop = Shop.new(
    name: "SHOP_#{n}",
  )

  (1..12).each do |m|
    shop.items.build(
      name: "item_#{m}",
      price: 500 * m,
      description: "item_#{m}の説明文"
    )
  end

  shop.save!
end
