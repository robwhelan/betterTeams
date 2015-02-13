class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  attr_accessor :assesment_disc_rank, :assessment_skill_rank, :assessment_value_rank

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :messages
  has_many :job_postings
  has_many :disc_assessments

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
  User.all.find_all do |user|
    job_posting.assessment_discs[0,2] == user.assessment_discs and
    (job_posting.assessment_values[0,3] & user.assessment_values).length >= 2 and
    (job_posting.assessment_skills[0,5] & user.assessment_skills).length >= 3
  end.map do |user|

    #SCORE SKILLS
    r = 15
    job_posting.aessessment_skills.each_with_index do |skill, i|
      skill_weight = 5 - i
      skill_value = user.assessment_skills.include?(skill) ? 1 : 0
      r -= skill_weight * skill_value
    end
    user.assessment_skill_rank = r

    #SCORE DISC
    r = 0
    assessment_disc_weights = [10, 8, 6, 4, 2]
    job_posting.assessment_discs.each_with_index do |disc, i|
      disc_weight = assesment_disc_weights[i]
      disc_value = user.assessment_discs.index(disc) - i
      r += disc_weight * disc_value
    end
    user.assesment_disc_rank = r

  end.sort do |user1, user2|
    if user1.assessment_disc_rank == user2.assessment_disc_rank
       user1.assessment_skill_rank <=> user2.assessment_skill_rank
    else
       user1.assessment_disc_rank <=> user2.assessment_disc_rank
    end        
  end #find_all

end #self.matches_with_job_posting

end