class JobValue < ActiveRecord::Base
  belongs_to :assessment_value
  belongs_to :job_posting
  belongs_to :job_benchmark
end
