class UserValue < ActiveRecord::Base
  belongs_to :user
  belongs_to :assessment_value
end
