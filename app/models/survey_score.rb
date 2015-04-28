class SurveyScore < ActiveRecord::Base
  belongs_to :comms_question
  belongs_to :comms_survey

end
