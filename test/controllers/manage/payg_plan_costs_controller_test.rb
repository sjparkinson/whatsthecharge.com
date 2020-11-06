require 'test_helper'

class PaygPlanCostsControllerTest < ActionDispatch::IntegrationTest
  def setup
    login_as users(:john)
  end

  test 'should get index' do
    get manage_payg_plan_payg_plan_costs_path(payg_plans(:polar_instant))
    assert_response :success
  end

  test 'should get new' do
    get new_manage_payg_plan_payg_plan_cost_path(payg_plans(:polar_instant))
    assert_response :success
  end

  test 'should create new' do
    post manage_payg_plan_payg_plan_costs_path(payg_plans(:polar_instant)),
         params: {
           payg_plan_cost: {
             cost_per_kwh_currency: 'GBP',
             cost_per_kwh: '0.24',
             ended_at: DateTime.new
           }
         }
    assert_redirected_to manage_payg_plan_payg_plan_costs_path(payg_plans(:polar_instant))
  end

  test 'should get edit' do
    get edit_manage_payg_plan_payg_plan_cost_path(payg_plans(:polar_instant), payg_plan_costs(:previous))
    assert_response :success
  end

  test 'should update' do
    patch manage_payg_plan_payg_plan_cost_path(payg_plans(:polar_instant), payg_plan_costs(:previous)),
          params: {
            payg_plan_cost: {
              ended_at: DateTime.new
            }
          }
    assert_redirected_to manage_payg_plan_payg_plan_costs_path(payg_plans(:polar_instant))
  end

  test 'should destroy' do
    delete manage_payg_plan_payg_plan_cost_path(payg_plans(:polar_instant), payg_plan_costs(:previous))
    assert_redirected_to manage_payg_plan_payg_plan_costs_path(payg_plans(:polar_instant))
  end
end
