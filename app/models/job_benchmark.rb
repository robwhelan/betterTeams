class JobBenchmark < ActiveRecord::Base
  has_many :job_values
  has_many :assessment_values, through: :job_values

  has_many :job_skills
  has_many :assessment_skills, through: :job_skills

  has_many :job_discs
  has_many :assessment_discs, through: :job_discs
  
  has_many :job_tasks
  has_many :task_statements, through: :job_tasks

  has_many :job_postings
  has_many :job_tasks

  #when assigning skills to a job benchmark:
  #@job_benchmark.assessment_skills<<AssessmentSkill.find_by_name("Analytical Problem Solving")

end
