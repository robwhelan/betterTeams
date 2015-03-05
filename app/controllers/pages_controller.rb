class PagesController < ApplicationController
  before_action :authenticate_user!, :except => [:demo]

  def home
  end
  
  def demo
  end

  def add_user_to_dashboard
    @added_user = User.find(params[:user])
    @disc_assessment = @added_user.disc_assessments.last
    @value_assessment = @added_user.value_assessments.last
    @skill_assessment = @added_user.skill_assessments.last    
    respond_to do |format|
      format.js
    end    
  end

  def my_job_postings
    @job_postings = current_user.job_postings
  end
  
  def job_matches
    @job_posting = JobPosting.find(params[:job_posting])
    @users = User.matches_with_job_posting(@job_posting.id)
  end
  
  def user_dashboard
    if params[:user] 
      @user = User.find(params[:user])
    else
      @user = current_user
    end
    @disc_assessment = @user.disc_assessments.last
    @value_assessment = @user.value_assessments.last
    @skill_assessment = @user.skill_assessments.last
    @users = User.all
    gon.users = @users
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
