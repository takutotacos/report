require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user_for_test_password = User.new(user_name: "12")
    @user_for_test_name = User.new(password: "123456", password_confirmation: "123456")

    # test for password
    # @user_with_not_enough_pass = User.new(name: "12", password: "12345", password_confirmation: "12345")
    # @user_with_lower_limit_pass_length = User.new(name: "12", password: "123456", password_confirmation: "123456")
    # @user_with_different_pass = User.new(name: "12", password: "123456", password_confirmation: "1234567")

    # test for name
    # @user_with_too_short_name = User.new(name: "1", password: "123456", password_confirmation: "123456")
    # @user_with_too_long_name = User.new(name: "12345678901", password: "123456", password_confirmation: "123456")
    # @user_with_lower_limit_name_length = User.new(name: "12", password: "123456", password_confirmation: "123456")
    # @user_with_upper_limit_name_length = User.new(name: "1234567890", password: "123456", password_confirmation: "123456")
end

  test "password should be longer than 5 digits" do
    @user_for_test_password.password = @user_for_test_password.password_confirmation = "1" * 5
    assert_not @user_for_test_password.valid?
  end

  test "password can equal to 6 digits" do
    @user_for_test_password.password = @user_for_test_password.password_confirmation = "1" * 6
    assert @user_for_test_password.valid?
  end

  test "password should match the confirmation one" do
    @user_for_test_password.password = "1" * 6
    @user_for_test_password.password_confirmation ="2" * 6
    assert_not @user_for_test_password.valid?
  end

  test "name should be longer than 1 letter" do
    @user_for_test_name.user_name = "1" * 1
    assert_not @user_for_test_name.valid?
  end

  test "name can equal to 2 letters" do
    @user_for_test_name.user_name = "1" * 2
    assert @user_for_test_name.valid?
  end

  test "name can equal to 10 letters" do
    @user_for_test_name.user_name = "1" * 10
    assert @user_for_test_name.valid?
  end

  test "name should be less than 11 letters" do
    @user_for_test_name.user_name = "1" * 11
    assert_not @user_for_test_name.valid?
  end

end
