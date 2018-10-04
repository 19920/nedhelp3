require 'test_helper'

class RequestsControllerTest < ActionDispatch::IntegrationTest
test "should add new request" do
  request = {:request => {:title =>'need jacket', :description =>'really need jacket',:address =>'stockholm',:request_type =>'help',:answers_count =>'0'}}
  post '/requests', :params => request
  assert_response 200
end
test "should return error with empty params" do
  request = {:request => {:title =>'',:description =>'',:address =>'',:request_type =>'',:answers_count =>'',:answers_count =>''}}
  get '/requests', :params => request
  assert_response 400
end
test "should turns error with empty title"do
  request = {:request => {:title => '', :description =>'really need jacket',:address =>'stockholm',:request_type =>'help',:answers_count =>'0'}}
  post '/requests', :params => request
  assert_response 400
end
end
