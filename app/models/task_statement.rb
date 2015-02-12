class TaskStatement < ActiveRecord::Base
  has_many :job_tasks
  has_many :job_benchmarks, through: :job_tasks

end
