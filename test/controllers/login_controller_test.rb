require "test_helper"

class LoginControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  test "login action test" do
    get login_action_path
    assert_select "h1", "ログイン"
  end
end
