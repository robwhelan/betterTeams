class AddDefaultValueToSurveyScore < ActiveRecord::Migration
  def change
    change_column :survey_scores, :score, :integer, :default => 0
  end
end