class CreatePlanCosts < ActiveRecord::Migration[6.0]
  def change
    create_table :payg_plan_costs, id: :uuid, comment: 'Current and historic costs for pay as you go plans.' do |t|
      t.text :description

      t.money :cost_per_kwh
      t.string :cost_per_kwh_currency, size: 3, comment: 'ISO 4217 three character currency code.'

      t.money :cost_per_minute
      t.string :cost_per_minute_currency, size: 3, comment: 'ISO 4217 three character currency code.'

      t.datetime :ended_at, comment: 'When this cost becomes unavailable.'

      t.belongs_to :payg_plan, type: :uuid, foreign_key: true, index: true

      t.timestamps

      t.index :payg_plan_id, name: 'index_null_ended_at_payg_plan_costs_on_payg_plan_id', unique: true, where: "ended_at IS NULL"
    end

    create_table :membership_plan_costs, id: :uuid, comment: 'Current and historic costs for membership plans.' do |t|
      t.text :description

      t.money :cost_per_kwh
      t.string :cost_per_kwh_currency, size: 3, comment: 'ISO 4217 three character currency code.'

      t.money :cost_per_minute
      t.string :cost_per_minute_currency, size: 3, comment: 'ISO 4217 three character currency code.'

      t.datetime :ended_at, comment: 'When this cost becomes unavailable.'

      t.belongs_to :membership_plan, type: :uuid, foreign_key: true, index: true

      t.timestamps

      t.index :membership_plan_id, name: 'index_null_ended_at_membership_plan_costs_on_membership_plan_id', unique: true, where: "ended_at IS NULL"
    end
  end
end
