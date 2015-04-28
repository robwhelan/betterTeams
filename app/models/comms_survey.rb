class CommsSurvey < ActiveRecord::Base
  belongs_to :improvement_plan
  belongs_to :user

  has_many :survey_scores
  has_many :comms_questions, through: :survey_scores
  accepts_nested_attributes_for :survey_scores

  def load_survey_questions
    # refactor this as a general way to rank disc assessments
    d = DiscAssessment.find(self.user.disc_assessments.last)
    hash = {"Driver" => d.driver_score, "Influencer" => d.influencer_score, "Sociable" => d.sociable_score, "Conscientious" => d.conscientious_score}
    array = hash.sort_by{|k,v| v}.reverse
    
    first_disc = AssessmentDisc.find_by_name(array[0][0])
    second_disc = AssessmentDisc.find_by_name(array[1][0])
    #assign the first 10 of the primary attribute questions
    survey_scores = []
    for i in 0..9 do  
      survey_scores << self.survey_scores.create(:comms_question_id => first_disc.comms_questions[i].id)
    end

    #assign the first 10 of the primary attribute questions
    for i in 0..4 do  
      survey_scores << self.survey_scores.create(:comms_question_id => second_disc.comms_questions[i].id)
    end
    return survey_scores
  end

  def survey_scores_attributes=(attributes)
   # Process the attributes hash
  end

end