class JobTask < ActiveRecord::Base
  belongs_to :task_statement
  belongs_to :job_benchmark
end
