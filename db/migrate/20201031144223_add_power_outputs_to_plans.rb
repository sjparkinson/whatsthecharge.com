class AddPowerOutputsToPlans < ActiveRecord::Migration[6.0]
  def change
    add_column :payg_plans, :power_outputs, :integer, array: true, comment: 'Supported power outputs, e.g. 7, 11, 22.'
    add_index :payg_plans, :power_outputs, using: 'gin'

    add_column :membership_plans, :power_outputs, :integer, array: true, comment: 'Supported power outputs, e.g. 7, 11, 22.'
    add_index :membership_plans, :power_outputs, using: 'gin'
  end
end
