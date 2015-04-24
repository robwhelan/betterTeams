class ImprovementPlan < ActiveRecord::Base
  belongs_to :initiator, class_name: 'User', foreign_key: 'initiated_id'
  belongs_to :follower, class_name: 'User', foreign_key: 'follower_id'

  has_many :comms_surveys
  
  has_many :improvement_scores
  has_many :comms_questions, through: :improvement_scores
  
end
