require 'test_helper'

class IndexControllerTest < ActionDispatch::IntegrationTest
  test 'should redirect root to country' do
    get root_url
    assert_redirected_to networks_url(countryCode: 'gb')
  end

  test 'should get /healthz' do
    get healthz_url
    assert_response :success
  end
end
