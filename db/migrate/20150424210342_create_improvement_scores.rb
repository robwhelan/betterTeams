class CreateImprovementScores < ActiveRecord::Migration
  def change
    create_table :improvement_scores do |t|
      t.belongs_to :comms_question, index: true
      t.belongs_to :improvement_plan, index: true
      t.integer :score

      t.timestamps
    end
  end
end
