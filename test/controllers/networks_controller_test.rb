require 'test_helper'

class NetworksControllerTest < ActionDispatch::IntegrationTest
  test 'should get /:country/networks' do
    get networks_path(countryCode: 'gb')
    assert_response :success
    assert_select 'div.card', Network.count
  end

  test 'should get /:country/network/:slug' do
    get network_path(countryCode: 'gb', slug: networks(:polar_instant).slug)
    assert_response :success
  end
end
