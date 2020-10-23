class UpdateMembershipPlans < ActiveRecord::Migration[6.0]
  def change
    remove_column :membership_plans, :price_one_off, :money
    remove_column :membership_plans, :price_one_off_currency, :string, size: 3
    remove_column :membership_plans, :price_per_month, :money
    remove_column :membership_plans, :price_per_month_currency, :money, size: 3

    add_column :membership_plans, :cost, :money, comment: 'The recurring or one-off cost of this plan.'
    add_column :membership_plans, :cost_currency, :string, size: 3, comment: 'ISO 4217 three character currency code.'

    add_column :membership_plans, :cost_frequency, :integer, null: false, comment: 'The cost frequency enum, e.g. none, annually, monthly, etc.'

    add_index :membership_plans, :cost_frequency
  end
end
