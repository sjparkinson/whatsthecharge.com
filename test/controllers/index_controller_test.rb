require 'test_helper'

class IndexControllerTest < ActionDispatch::IntegrationTest
  test 'should redirect root to country' do
    get root_url
    assert_redirected_to uk_url
  end

  test 'should get /uk' do
    get uk_url
    assert_response :success
  end

  test 'should get /healthz' do
    get healthz_url
    assert_response :success
  end
end
