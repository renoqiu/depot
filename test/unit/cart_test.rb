require 'test_helper'

class CartTest < ActiveSupport::TestCase
  test "add unique products" do
    cart = Cart.new
    cart.add_product(products(:ruby).id)
    cart.add_product(products(:one).id)
    cart.save!
    assert cart.valid?
    assert cart.line_items.size == 2
    assert cart.total_price == 59.49
  end

  test "add duplicate products" do
    cart = Cart.new
    cart.add_product(products(:one).id)
    cart.add_product(products(:one).id)
    cart.save!
    assert cart.valid?
    assert cart.line_items.size == 2
    assert cart.total_price == 19.98
  end
  # test "the truth" do
  #   assert true
  # end
end
