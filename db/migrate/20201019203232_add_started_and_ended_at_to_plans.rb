class AddStartedAndEndedAtToPlans < ActiveRecord::Migration[6.0]
  def change
    add_column :payg_plans, :started_at, :timestamp, precision: 6
    add_column :payg_plans, :ended_at, :timestamp, precision: 6

    add_column :membership_plans, :started_at, :timestamp, precision: 6
    add_column :membership_plans, :ended_at, :timestamp, precision: 6
  end
end
