class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  attr_accessor :assessment_disc_rank, :assessment_skill_rank, :assessment_value_rank, :job_fit_score

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :messages
  has_many :job_postings
  has_many :disc_assessments
  has_many :value_assessments
  has_many :skill_assessments
  belongs_to :company

  has_many :user_discs
  has_many :assessment_discs, through: :user_discs
  
  has_many :user_skills
  has_many :assessment_skills, through: :user_skills

  has_many :user_values
  has_many :assessment_values, through: :user_values
  
  has_many :initiated_improvement_plans, class_name: 'ImprovementPlan', foreign_key: 'initiator_id'
  has_many :followed_improvement_plans, class_name: 'ImprovementPlan', foreign_key: 'follower_id'

  UserDetails = Struct.new(:id, :user_first_name, :user_last_name)

def self.matches_with_job_posting(job_posting_id)
  #job_posting_id = 4
  job_posting = JobPosting.find(job_posting_id)

  #the first part just filters out users who don't pass based matching needs
  y = User.all
  #.find_all do |user|
  #  job_posting.assessment_discs[0,2] == user.assessment_discs[0,2] and
  #  (job_posting.assessment_values[0,3] & user.assessment_values).length >= 1 and
  #  (job_posting.assessment_skills[0,5] & user.assessment_skills).length >= 2
  #end
  
  y.each do |user|
    #score based on disc
      r = 0
      assessment_disc_weights = [22, 11]
      job_posting.assessment_discs.each_with_index do |disc, i|
        disc_weight = assessment_disc_weights[i]
        disc_value = user.assessment_discs[0,2].include?(disc) ? 1 : 0      
        r += disc_weight * disc_value
      end
      user.assessment_disc_rank = r
    
      #score based on values
      r = 0
      assessment_value_weights = [13, 11, 9]
      job_posting.assessment_values.each_with_index do |value, i|
        value_weight = assessment_value_weights[i]
        value_value = user.assessment_values[3,3].include?(value) ? 1 : 0 #3
        r += value_weight * value_value
      end
      user.assessment_value_rank = r

      #score based on skill
      r = 0
      assessment_skill_weights = [9, 8, 6, 5, 5]
      job_posting.assessment_skills.each_with_index do |skill, i|
        skill_weight = assessment_skill_weights[i]
        skill_value = user.assessment_skills[18,5].include?(skill) ? 1 : 0 #18
        r += skill_weight * skill_value
      end
      user.assessment_skill_rank = r
    
      user.job_fit_score = user.assessment_disc_rank + user.assessment_skill_rank + user.assessment_value_rank
  end

  return y.sort_by(&:job_fit_score).reverse

end #self.matches_with_job_posting


#maybe refactor this to just be a function that sorts discs, then pass that array to a function that assigns the discs to the user.
def assign_discs_to_user
  
  d = DiscAssessment.find(self.disc_assessments.last.id)
  hash = {"Driver" => d.driver_score, "Influencer" => d.influencer_score, "Sociable" => d.sociable_score, "Conscientious" => d.conscientious_score}
  array = hash.sort_by{|k,v| v}.reverse
  
  array.each do |disc|
    self.assessment_discs << AssessmentDisc.find_by_name(disc[0])
  end
  
end #assign_discs_to_user

def assign_values_to_user
  v = ValueAssessment.find(self.value_assessments.last.id)
  hash = {  "Aesthetic" => v.aesthetic_score, 
            "Economic" => v.utilitarian_score,
            "Political" => v.individualistic_score,
            "Social" => v.social_score,
            "Theoretical" => v.theoretical_score,
            "Traditional" => v.traditional_score }
            
  array = hash.sort_by{|k,v| v}.reverse
  
  array.each do |val|
    self.assessment_values << AssessmentValue.find_by_name(val[0])
  end
end #assign_values_to_user

def assign_skills_to_user
  s = SkillAssessment.find(self.skill_assessments.last.id)
  hash = {  "Analytical Problem Solving" => s.analytical_problem_solving_score,
            "Conflict Management" => s.conflict_management_score,
            "Continuous Learning" => s.continuous_learning_score,
            "Creativity/Innovation" => s.creativity_score,
            "Customer Service" => s.customer_service_score,
            "Decision Making" => s.decision_making_score,
            "Diplomacy" => s.diplomacy_score,
            "Empathy" => s.empathy_score,
            "Employee Development/Coaching" => s.employee_development_score,
            "Flexibility" => s.flexibility_score,
            "Futuristic Thinking" => s.futuristic_thinking_score,
            "Goal Orientation" => s.goal_orientation_score,
            "Interpersonal Skills" => s.interpersonal_skills_score,
            "Leadership" => s.leadership_score,
            "Management" => s.management_score,
            "Negotiation" => s.negotiation_score,
            "Personal Effectiveness" => s.personal_effectiveness_score,
            "Persuasion" => s.persuasion_score,
            "Planning and Organizing" => s.planning_score,
            "Presenting" => s.presenting_score,
            "Self-Management" => s.self_management_score,
            "Teamwork" => s.teamwork_score,
            "Written Communication" => s.written_communication_score }
            
  array = hash.sort_by{|k,v| v}.reverse
  
  array.each do |skill|
    self.assessment_skills << AssessmentSkill.find_by_name(skill[0])
  end
end #assign_skills_to_user


def self.with_names
  ary = []
  y = User.all

  y.each do |u|
    x = UserDetails.new(u.id, u.first_name, u.last_name)
    ary << x
  end
  return ary
end #self.with_names


end