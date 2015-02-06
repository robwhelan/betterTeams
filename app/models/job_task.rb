class JobTask < ActiveRecord::Base
  belongs_to :job_benchmark
  belongs_to :job_posting
end
