class ImprovementPlan < ActiveRecord::Base
  belongs_to :initiator, class_name: 'User', foreign_key: 'initiator_id'
  belongs_to :follower, class_name: 'User', foreign_key: 'follower_id'

  has_many :comms_surveys
  
  has_many :survey_scores, through: :comms_surveys
  
  has_many :improvement_scores
  has_many :comms_questions, through: :improvement_scores
  
  after_create :initiate_improvement_plan_emails
  
  RankedCommsQuestion = Struct.new(:body, :score)
  
  def count_comms_surveys_completed_for(user)
    self.comms_surveys.where(:user_id => user.id).count
  end
  
  def ranked_survey_responses(user)
    # all comss surveys will hav ethe same quesitons
    # take the first comms survey
    # then take all the survey responses scores
    # then sum them up
    # then update the survey scores attached to the first comms survey with the ranking
    
    
    # get the comms surveys for the improvement plan user.
    # get the survey scores from each comms survey in a big array.
    # then sort them by comms question.
    # then 
    
    #comms_surveys = self.comms_surveys.where(:user_id => user.id)
    #comms_surveys.each do |c|
      
    
    survey_scores = self.survey_scores.where(:comms_survey_id)
    survey_scores = SurveyScore.all.find_all do |survey_score|
      self.comms_surveys.where(:user_id => user.id ).map {|x| x.id}.include? survey_score.comms_survey_id
    end
    
    ranked_comms_questions = []
    comms_question_ids = survey_scores.map { |x| x.comms_question_id }.uniq
    
    comms_question_ids.each do |c|
      r = 0
      #comms_question.survey_scores
      survey_scores.select {|v| v.comms_question_id == c}.each do |survey|
        r = r + survey.score
      end
      ranked_question = RankedCommsQuestion.new(CommsQuestion.find(c).body, r)
      ranked_comms_questions << ranked_question
    end
    return ranked_comms_questions.sort_by(&:score).reverse
  end

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
        "from_name"=>"BetterTeams",
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