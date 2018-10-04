require 'test_helper'

class RequestTest < ActiveSupport::TestCase
  test "should not save empty request form " do
  request = Request.new
  assert_not request.save
end

test "it should not save request with empty title" do
  request= Request.new(title: 'john', :description =>'really need jacket',:address =>'stockholm',:request_type =>'help',:answers_count =>'0')
  assert_not request.save
end
test "should return error with empty address" do
  request = Request.new(:title =>'john',:description =>'really need jacket',:address =>'',:request_type =>'help',:answers_count =>'0')
  assert_not request.save
end
end
