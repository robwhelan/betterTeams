class CommsQuestion < ActiveRecord::Base
  belongs_to :assessment_disc

  has_many :survey_scores
  has_many :comms_surveys, through: :survey_scores
  
  has_many :improvement_scores
  has_many :improvement_plans, through: :improvement_scores
  
end
