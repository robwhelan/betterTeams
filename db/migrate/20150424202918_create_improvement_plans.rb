class CreateImprovementPlans < ActiveRecord::Migration
  def change
    create_table :improvement_plans do |t|
      t.belongs_to :initiator, index: true
      t.belongs_to :follower, index: true

      t.timestamps
    end
  end
end
