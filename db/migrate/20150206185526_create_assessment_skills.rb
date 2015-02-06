class CreateAssessmentSkills < ActiveRecord::Migration
  def change
    create_table :assessment_skills do |t|
      t.string :name

      t.timestamps
    end
  end
end
