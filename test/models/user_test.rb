require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "a user should enter a first name" do
    user = User.new
    assert  !user.save
    assert !user.errors[:first_name].empty?
  end
  test "case sensitive email address" do
    user = User.new(email: "John.Doe@example.com")
    assert_equal "John.Doe@example.com", user.email
  end
  
end
