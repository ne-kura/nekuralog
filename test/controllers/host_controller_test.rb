require 'test_helper'

class HostControllerTest < ActionDispatch::IntegrationTest
  test "should get login" do
    get host_login_url
    assert_response :success
  end

end
