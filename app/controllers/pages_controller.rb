class PagesController < ApplicationController
  before_action :authenticate_user!, :except => [:demo]

  def home
  end
  
  def demo
  end

  def gap_analysis
    @user = User.find(params[:user])
    @job_posting = JobPosting.find(params[:job])

    #user info
    @disc_assessment = @user.disc_assessments.last
    @value_assessment = @user.value_assessments.last
    @skill_assessment = @user.skill_assessments.last
    
    d = @user.disc_assessments.last
    hash = {"Driver" => [d.driver_score, 1], "Influencer" => [d.influencer_score, 2], "Sociable" => [d.sociable_score, 3], "Conscientious" => [d.conscientious_score, 4]}
    @user_discs = hash.sort_by{|k,v| v}.reverse
    
    v = @user.value_assessments.last
    hash = {  "Aesthetic" => [v.aesthetic_score, 1], 
              "Economic" => [v.utilitarian_score, 2],
              "Political" => [v.individualistic_score, 3],
              "Social" => [v.social_score, 4],
              "Theoretical" => [v.theoretical_score, 5],
              "Traditional" => [v.traditional_score, 6] }
    @user_values = hash.sort_by{|k,v| v}.reverse
    
    s = @user.skill_assessments.last
    hash = {  "Analytical Problem Solving" => [s.analytical_problem_solving_score, 1],
              "Conflict Management" => [s.conflict_management_score, 2],
              "Continuous Learning" => [s.continuous_learning_score, 3],
              "Creativity/Innovation" => [s.creativity_score, 4],
              "Customer Service" => [s.customer_service_score, 5],
              "Decision Making" => [s.decision_making_score, 6],
              "Diplomacy" => [s.diplomacy_score, 7],
              "Empathy" => [s.empathy_score, 8],
              "Employee Development/Coaching" => [s.employee_development_score, 9],
              "Flexibility" => [s.flexibility_score, 10],
              "Futuristic Thinking" => [s.futuristic_thinking_score, 11],
              "Goal Orientation" => [s.goal_orientation_score, 12],
              "Interpersonal Skills" => [s.interpersonal_skills_score, 13],
              "Leadership" => [s.leadership_score, 14],
              "Management" => [s.management_score, 15],
              "Negotiation" => [s.negotiation_score, 16],
              "Personal Effectiveness" => [s.personal_effectiveness_score, 17],
              "Persuasion" => [s.persuasion_score, 18],
              "Planning and Organizing" => [s.planning_score, 19],
              "Presenting" => [s.presenting_score, 20],
              "Self-Management" => [s.self_management_score, 21],
              "Teamwork" => [s.teamwork_score, 22],
              "Written Communication" => [s.written_communication_score, 23] }
            
    @user_skills = hash.sort_by{|k,v| v}.reverse
    
    @job_discs = @job_posting.assessment_discs
    @job_values = @job_posting.assessment_values
    @job_skills = @job_posting.assessment_skills
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
