class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  attr_accessor :assessment_disc_rank, :assessment_skill_rank, :assessment_value_rank, :job_fit_score

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :messages
  has_many :job_postings
  has_many :disc_assessments
  belongs_to :company

  has_many :user_discs
  has_many :assessment_discs, through: :user_discs
  
  has_many :user_skills
  has_many :assessment_skills, through: :user_skills

  has_many :user_values
  has_many :assessment_values, through: :user_values


def self.matches_with_job_posting(job_posting_id)
  #job_posting_id = 4
  job_posting = JobPosting.find(job_posting_id)

  #the first part just filters out users who don't pass based matching needs
  y = User.all.find_all do |user|
    job_posting.assessment_discs[0,2] == user.assessment_discs and
    (job_posting.assessment_values[0,3] & user.assessment_values).length >= 1 and
    (job_posting.assessment_skills[0,5] & user.assessment_skills).length >= 2
  end
  
  y.each do |user|
    #score based on disc
    r = 0
    assessment_disc_weights = [22, 11]
    job_posting.assessment_discs.each_with_index do |disc, i|
      disc_weight = assessment_disc_weights[i]
      disc_value = user.assessment_discs.include?(disc) ? 1 : 0      
      r += disc_weight * disc_value
    end
    user.assessment_disc_rank = r
    
    #score based on values
    r = 0
    assessment_value_weights = [13, 11, 9]
    job_posting.assessment_values.each_with_index do |value, i|
      value_weight = assessment_value_weights[i]
      value_value = user.assessment_values.include?(value) ? 1 : 0
      r += value_weight * value_value
    end
    user.assessment_value_rank = r

    #score based on skill
    r = 0
    assessment_skill_weights = [9, 8, 6, 5, 5]
    job_posting.assessment_skills.each_with_index do |skill, i|
      skill_weight = assessment_skill_weights[i]
      skill_value = user.assessment_skills.include?(skill) ? 1 : 0
      r += skill_weight * skill_value
    end
    user.assessment_skill_rank = r
    
    user.job_fit_score = user.assessment_disc_rank + user.assessment_skill_rank + user.assessment_value_rank
    
  end

  return y.sort_by(&:job_fit_score).reverse

end #self.matches_with_job_posting

end