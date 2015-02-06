class JobSkill < ActiveRecord::Base
  belongs_to :assessment_skill
  belongs_to :job_posting
  belongs_to :job_benchmark
end
