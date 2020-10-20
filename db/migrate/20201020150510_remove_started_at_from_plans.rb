class RemoveStartedAtFromPlans < ActiveRecord::Migration[6.0]
  def change
    remove_column :payg_plans, :started_at
    remove_column :membership_plans, :started_at
  end
end
