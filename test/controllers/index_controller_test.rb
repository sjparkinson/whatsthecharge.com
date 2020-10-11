require 'test_helper'

class IndexControllerTest < ActionDispatch::IntegrationTest
  test 'should redirect root to country' do
    get apex_url
    assert_redirected_to root_url
  end

  test 'should get /uk' do
    get root_url(country: 'uk')
    assert_response :success
  end

  test 'should get /healthz' do
    get healthz_url
    assert_response :success
  end
end
