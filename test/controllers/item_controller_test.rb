require "test_helper"

class ItemControllerTest < ActionDispatch::IntegrationTest
  # test "should get home" do
  #   get item_home_url
  #   assert_response :success
  # end
  test "can acccess home path" do
    get root_path
    assert_select "h1", "商品一覧"
  end
end
