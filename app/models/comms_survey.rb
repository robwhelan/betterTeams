class CommsSurvey < ActiveRecord::Base
  belongs_to :improvement_plan
  belongs_to :user

  has_many :survey_scores
  has_many :comms_questions, through: :survey_scores

end