class AddPlanUrlToPlans < ActiveRecord::Migration[6.0]
  def change
    add_column :payg_plans, :plan_url, :string
    add_column :membership_plans, :plan_url, :string
  end
end
