class CreatePaygPlans < ActiveRecord::Migration[6.0]
  def change
    create_table :payg_plans,
                 id: :uuid,
                 comment:
                   'Network pay-as-you-go plans, e.g. Polar Instant.' do |t|
      t.string :name
      t.text :description

      t.belongs_to :network, type: :uuid, foreign_key: true, index: true

      t.timestamps
    end
  end
end
