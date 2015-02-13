class AssessmentSkill < ActiveRecord::Base
  has_many :job_skills
  has_many :job_postings, through: :job_skills
  has_many :job_benchmarks, through: :job_skills

  has_many :user_skills
  has_many :users, through: :user_skills
  
end
