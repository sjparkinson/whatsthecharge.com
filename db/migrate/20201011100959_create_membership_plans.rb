class CreateMembershipPlans < ActiveRecord::Migration[6.0]
  def change
    create_table :membership_plans,
                 id: :uuid,
                 comment:
                   'Network memberships, e.g. Source London\'s Full membership.' do |t|
      t.string :name, null: false
      t.text :description

      t.money :price_one_off,
              null: true,
              comment:
                'One-off cost to become a member, e.g. Source London\'s Flexi membership.'
      t.string :price_one_off_currency,
               size: 3,
               null: false,
               comment: 'ISO 4217 three character currency code.'

      t.money :price_per_month, null: true
      t.string :price_per_month_currency,
               size: 3,
               null: false,
               comment: 'ISO 4217 three character currency code.'

      t.belongs_to :network, type: :uuid, foreign_key: true, index: true

      t.timestamps
    end
  end
end
