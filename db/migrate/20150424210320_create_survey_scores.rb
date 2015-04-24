class CreateSurveyScores < ActiveRecord::Migration
  def change
    create_table :survey_scores do |t|
      t.belongs_to :comms_question, index: true
      t.belongs_to :comms_survey, index: true
      t.integer :score

      t.timestamps
    end
  end
end
