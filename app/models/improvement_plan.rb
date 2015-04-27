class ImprovementPlan < ActiveRecord::Base
  belongs_to :initiator, class_name: 'User', foreign_key: 'initiator_id'
  belongs_to :follower, class_name: 'User', foreign_key: 'follower_id'

  has_many :comms_surveys
  
  has_many :improvement_scores
  has_many :comms_questions, through: :improvement_scores
  
  after_create :initiate_improvement_plan_emails
  
  def initiate_improvement_plan_emails
    #send email to initiator and to follower
  end
  
end