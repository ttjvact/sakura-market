require "test_helper"

class CartTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  def setup
    @cart = carts(:test_cart)
    @cart300 = carts(:test_cart_cash300)
    @cart400 = carts(:test_cart_cash400)
    @cart600 = carts(:test_cart_cash600)
    @cart1000 = carts(:test_cart_cash1000)
    @cart_num5 = carts(:test_cart_num5)
    @cart_num6 = carts(:test_cart_num6)
  end

  test "should be valid" do
    assert @cart.valid?
  end

  test "collect cash fee" do
    assert_equal 300, @cart300.cash_fee
    assert_equal 400, @cart400.cash_fee
    assert_equal 600, @cart600.cash_fee
    assert_equal 1000, @cart1000.cash_fee
  end

  test "collect shipping fee" do
    assert_equal 600, @cart_num5.shipping_fee
    assert_equal 1200, @cart_num6.shipping_fee
  end

end
