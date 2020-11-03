require 'test_helper'

class ManageNetworksControllerTest < ActionDispatch::IntegrationTest
  def setup
    login_as users(:john)
  end

  test 'should get index' do
    get manage_networks_path
    assert_response :success
  end

  test 'should get new' do
    get new_manage_network_path
    assert_response :success
  end

  test 'should create' do
    post manage_networks_path,
         params: {
           network: {
             name: 'Source London',
             slug: 'source-london',
             description: 'TBC',
             website_url: 'https://sourcelondon.net/',
             country_id: countries(:gb).id
           }
         }
    assert_redirected_to manage_networks_path
  end

  test 'should get edit' do
    get edit_manage_network_path(networks(:polar_instant))
    assert_response :success
  end

  test 'should update' do
    patch manage_network_path(networks(:polar_instant)),
          params: { network: { name: 'Source London (Edited)' } }
    assert_redirected_to manage_networks_path
  end

  test 'should destroy' do
    delete manage_network_path(networks(:polar_instant))
    assert_redirected_to manage_networks_path
  end
end
