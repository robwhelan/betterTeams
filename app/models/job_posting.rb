class JobPosting < ActiveRecord::Base
  belongs_to :job_benchmark
  belongs_to :user

  has_many :job_values
  has_many :assessment_values, through: :job_values

  has_many :job_skills
  has_many :assessment_skills, through: :job_skills

  has_many :job_discs
  has_many :assessment_discs, through: :job_discs

  has_many :job_tasks
  has_many :messages

end
