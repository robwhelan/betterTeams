class PagesController < ApplicationController
  def home
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

    respond_to do |format|
      format.js
    end    
  end

end
