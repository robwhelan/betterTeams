class ImprovementPlan < ActiveRecord::Base
  belongs_to :initiator, class_name: 'User', foreign_key: 'initiator_id'
  belongs_to :follower, class_name: 'User', foreign_key: 'follower_id'

  has_many :comms_surveys
  
  has_many :improvement_scores
  has_many :comms_questions, through: :improvement_scores
  
  after_create :initiate_improvement_plan_emails
  
  def initiate_improvement_plan_emails
    follower = self.follower
    initiator = self.initiator
    params = '?user=' + follower.id.to_s + '&improvement_plan=' + self.id.to_s

    if Rails.env == "development"
      mandrill = Mandrill::API.new 'PVZ2WOxJtKZam_15Sfzt9Q'
    else
      mandrill = Mandrill::API.new ENV['MANDRILL_APIKEY'] #'PVZ2WOxJtKZam_15Sfzt9Q'
    end
    
    follower_message = {
         "subject"=>"You have been invited to participate in an improvement plan!",
         "text"=>"You have been invited to participate in an improvement plan.",
         "from_email"=>"whelan@gmail.com",
        "from_name"=>"Rob Whelan",
         "merge_language"=>"mailchimp",
         "inline_css"=>nil,
         "recipient_metadata"=>
            [{"values"=>{"user_id"=> follower.id }, "rcpt"=> follower.email}],
         "to"=>
            [{"name"=> follower.first_name + " " + follower.last_name,
                "type"=>"to",
                "email"=> follower.email }],
         "html"=> 	 "<p>Dear " + follower.first_name + ",</p>" +
	                   "<p>You've been invited by " + initiator.first_name + " " + initiator.last_name + " to work through a fun project to improve your team communications.</p>" +
	                   "<p>It starts with you having five people, who know you well, to take a super short survey about you. It takes less than three minutes.</p>" + 
	                   "<p>All they have to do is pick five things people need to know when communicating with you!</p>" +
	                   "<p><strong>Important:</strong> share <a href='http://www.betterteams.co/comms_surveys/new#{params}'>this link</a> to take the survey. It's your personal survey link.</p>"
                   }	 
      async = false
      ip_pool = "Main Pool"
      result = mandrill.messages.send follower_message, async, ip_pool
  end
    
end