require 'test_helper'

class WelcomePageControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get welcome_page_index_url
    assert_response :success
  end

  test "should get location" do
    get welcome_page_location_url
    assert_response :success
  end

end
