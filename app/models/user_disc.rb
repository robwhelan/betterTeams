class UserDisc < ActiveRecord::Base
  belongs_to :user
  belongs_to :assessment_disc
end
