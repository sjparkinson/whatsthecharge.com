require 'test_helper'

class ErrorsControllerTest < ActionDispatch::IntegrationTest
  test 'serves not found error page' do
    get '/404'
    assert_response :not_found
  end

  test 'serves unprocessable entity error page' do
    get '/422'
    assert_response :unprocessable_entity
  end

  test 'serves internal server error page' do
    get '/500'
    assert_response :internal_server_error
  end
end
