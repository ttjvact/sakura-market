require "test_helper"

class UserTest < ActiveSupport::TestCase

  def setup
    @user = User.new(email: "test1@example.com", password: "testtest1234", password_confirmation: "testtest1234")
  end

  test "should be valid" do
    assert @user.valid?
  end

  test "email should be present" do
    @user.email = " "
    assert_not @user.valid?
  end

  test "email should not be too long" do
    @user.email = "a" * 244 + "@example.com"
    assert_not @user.valid?
  end

  test "email validation should accept valid addresses" do 
    valid_addresses = %w[user@example,com user_at_foo.org user.name@example.
      foo@bar_baz.com foo@bar+baz.com foo@bar..com]
    valid_addresses.each do |valid_address|
      @user.email = valid_address
      assert_not @user.valid?, "#{valid_address.inspect} should ve valid"
    end
  end

  test "email addresses should be unique" do
    dpulicate_user = @user.dup
    @user.save
    assert_not dpulicate_user.valid?
  end

  test "password should be present (nonblank)" do
    @user.password = @user.password_confirmation = " " * 9
    assert_not @user.valid?
  end

  test "password should have a minimum length" do
    @user.password = @user.password_confirmation = "a" * 5
    assert_not @user.valid?
  end

  test "user address should be destroy" do
    @user.save
    @user.addresses.create(name:'test user', postal_code: '1111111')
    assert_difference 'Address.count', -1 do
      @user.destroy
    end
  end

  test "user carts should be destroy" do
    @user.save
    @user.carts.create
    assert_difference 'Cart.count', -1 do
      @user.destroy
    end
  end

end
