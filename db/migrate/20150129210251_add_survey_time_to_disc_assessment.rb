class AddSurveyTimeToDiscAssessment < ActiveRecord::Migration
  def change
    add_column :disc_assessments, :survey_time, :integer
  end
end
