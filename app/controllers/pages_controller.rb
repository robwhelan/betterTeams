class PagesController < ApplicationController
  before_action :authenticate_user!

  def home
  end

  def my_job_postings
    @job_postings = current_user.job_postings
  end

  def return_benchmark_data
    @job_benchmark = JobBenchmark.find_by_title(params[:jobTitle])

    @discs = @job_benchmark.assessment_discs
    nonDiscs=@discs.map(&:name)    
    @non_discs = AssessmentDisc.where.not(name: nonDiscs)
    
    @values = @job_benchmark.assessment_values
    nonValues = @values.map(&:name)    
    @non_values = AssessmentValue.where.not(name: nonValues)

    @skills = @job_benchmark.assessment_skills
    nonSkills = @skills.map(&:name)    
    @non_skills = AssessmentSkill.where.not(name: nonSkills)
    
    @tasks = @job_benchmark.task_statements

    respond_to do |format|
      format.js
    end    
  end

end
