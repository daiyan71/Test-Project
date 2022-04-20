require 'test_helper'

class AdminHomeControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get admin_home_home_url
    assert_response :success
  end

end
