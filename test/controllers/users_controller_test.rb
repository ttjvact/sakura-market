require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  test "user action test" do
    get new_users_path
    assert_select "h1", "会員登録"
  end
end
