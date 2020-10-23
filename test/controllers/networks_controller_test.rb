require 'test_helper'

class NetworksControllerTest < ActionDispatch::IntegrationTest
  test 'should get /:country/networks' do
    get networks_url(countryCode: 'uk')
    assert_response :success
    assert_select "div.card", Network.count
  end
end
