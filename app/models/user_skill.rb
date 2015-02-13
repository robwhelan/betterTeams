class UserSkill < ActiveRecord::Base
  belongs_to :user
  belongs_to :assessment_skill
end
