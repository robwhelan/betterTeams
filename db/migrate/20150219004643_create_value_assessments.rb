class CreateValueAssessments < ActiveRecord::Migration
  def change
    create_table :value_assessments do |t|
      t.belongs_to :user, index: true
      t.integer :aesthetic_score
      t.integer :individualistic_score
      t.integer :social_score
      t.integer :theoretical_score
      t.integer :traditional_score
      t.integer :utilitarian_score

      t.timestamps
    end
  end
end
