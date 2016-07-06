require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(name: "Test user", email: "testy@example.com", password: "password", password_confirmation:"password")
  end

  test "should be a valid user" do
    assert @user.valid?
  end

  test "should not be valid with no name" do
    @user.name = ""
    assert_not @user.valid?
  end

  test "should not be valid with no email" do
    @user.email = ""
    assert_not @user.valid?
  end

  test "name should be proper length" do
    @user.name = "a"
    assert_not @user.valid?
    @user.name = "a"*4
    assert @user.valid?
  end

  test "email should not be to long" do
    @user.email = "a"*244 + "@example.com"
    assert_not @user.valid?
  end
end
