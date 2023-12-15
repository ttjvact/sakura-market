require "test_helper"

class OrderTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @order = orders(:test_order)
  end
  
  test "should be valid" do
    assert @order.valid?
  end

  test "should not be valid" do
    @order.delivery_date = ""
    assert_not @order.valid?
  end
end
