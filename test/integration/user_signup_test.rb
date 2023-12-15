require "test_helper"

class UserSignupTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  test "create account test" do
    assert_difference 'User.count', 1 do
      post users_path, params: {
        user: {
          email: "test@example.com",
          password: "password",
          password_confirmation: "password"
        }
      }
    end
  end
end
