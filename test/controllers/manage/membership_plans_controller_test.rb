require 'test_helper'

class MambershipPlansControllerTest < ActionDispatch::IntegrationTest
  def setup
    login_as users(:john)
  end

  test 'should get index' do
    get manage_membership_plans_path
    assert_response :success
  end

  test 'should get new' do
    get new_manage_membership_plan_path
    assert_response :success
  end

  test 'should create new' do
    post manage_membership_plans_path,
         params: {
           membership_plan: {
             name: 'SmartCable',
             description: 'TBC',
             network_id: networks(:polar_plus).id,
             plan_url: 'https://polarinstant.com/',
             cost: '7.99',
             cost_currency: 'GBP',
             cost_frequency: 'monthly',
             ended_at: ''
           }
         }

    assert_redirected_to manage_membership_plans_path
  end

  test 'should get edit' do
    get edit_manage_membership_plan_path(membership_plans(:polar_plus))
    assert_response :success
  end

  test 'should update' do
    get edit_manage_membership_plan_path(membership_plans(:polar_plus))
    assert_response :success

    patch manage_membership_plan_path(membership_plans(:polar_plus)),
          params: {
            membership_plan: {
              name: 'SmartCable (Edited)',
              description: 'TBC',
              network_id: networks(:polar_plus).id,
              plan_url: 'https://polar-network.com/',
              cost: '8.99',
              cost_currency: 'GBP',
              cost_frequency: 'monthly',
              ended_at: ''
            }
          }
    assert_redirected_to manage_membership_plans_path
  end

  test 'should destroy' do
    delete manage_membership_plan_path(networks(:polar_plus))
    assert_redirected_to manage_membership_plans_path
  end
end
