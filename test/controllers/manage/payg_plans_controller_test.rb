require 'test_helper'

class PaygPlansControllerTest < ActionDispatch::IntegrationTest
  def setup
    login_as users(:john)
  end

  test 'should get index' do
    get manage_payg_plans_path
    assert_response :success
  end

  test 'should get new' do
    get new_manage_payg_plan_path
    assert_response :success
  end

  test 'should create new' do
    post manage_payg_plans_path,
         params: {
           payg_plan: {
             name: 'Pay As You Go',
             description: 'TBC',
             network_id: networks(:polar_instant).id,
             plan_url: 'https://polarinstant.com/',
             ended_at: ''
           }
         }

    assert_redirected_to manage_payg_plans_path
  end

  test 'should get edit' do
    get edit_manage_payg_plan_path(payg_plans(:polar_instant))
    assert_response :success
  end

  test 'should update' do
    get edit_manage_payg_plan_path(payg_plans(:polar_instant))
    assert_response :success

    patch manage_payg_plan_path(payg_plans(:polar_instant)),
          params: {
            payg_plan: {
              name: 'Pay As You Go (Edited)',
              description: 'TBC',
              network_id: networks(:polar_instant).id,
              plan_url: 'https://polarinstant.com/',
              ended_at: ''
            }
          }
    assert_redirected_to manage_payg_plans_path
  end

  test 'should destroy' do
    delete manage_payg_plan_path(networks(:polar_instant))
    assert_redirected_to manage_payg_plans_path
  end
end
