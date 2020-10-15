require 'test_helper'

class NetworksControllerTest < ActionDispatch::IntegrationTest
  test "should get /:country/networks" do
    get networks_url(country: 'uk')
    assert_response :success
  end
end
