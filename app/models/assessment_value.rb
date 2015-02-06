class AssessmentValue < ActiveRecord::Base
  has_many :job_values
  has_many :job_postings, through: :job_values
  has_many :job_benchmarks, through: :job_values

end
