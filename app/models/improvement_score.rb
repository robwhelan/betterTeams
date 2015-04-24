class ImprovementScore < ActiveRecord::Base
  belongs_to :comms_question
  belongs_to :improvement_plan
end
