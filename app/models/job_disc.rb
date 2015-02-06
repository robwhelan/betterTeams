class JobDisc < ActiveRecord::Base
  belongs_to :assessment_disc
  belongs_to :job_posting
  belongs_to :job_benchmark
end
