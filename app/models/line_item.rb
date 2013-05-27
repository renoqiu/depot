class LineItem < ActiveRecord::Base
  #attr_accessible :cart_id, :product_id, :product, :cart, :cart_id
  attr_accessible :product, :product_id, :id, :updated_at, :cart_id, :created_at
  belongs_to :cart
  belongs_to :product
  belongs_to :order

  def total_price
    product.price * quantity
  end
end
