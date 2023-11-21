require "test_helper"

class ItemControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get item_home_url
    assert_response :success
  end
end
