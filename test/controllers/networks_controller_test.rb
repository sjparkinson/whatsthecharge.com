require 'test_helper'

class NetworksControllerTest < ActionDispatch::IntegrationTest
  test "should get /networks" do
    get networks_url
    assert_response :success
  end
end
