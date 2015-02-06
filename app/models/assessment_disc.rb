class AssessmentDisc < ActiveRecord::Base
  has_many :job_discs
  has_many :job_postings, through: :job_discs
  has_many :job_benchmarks, through: :job_discs
end
