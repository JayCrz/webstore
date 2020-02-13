module ProductsHelper
  def image_check(product)
    if product.images.attached?
      image_tag product.images.first.variant(resize_to_limit: [300, 250])
    else
      image_tag "http://fakeimg.pl/300x250"
    end
  end
end
