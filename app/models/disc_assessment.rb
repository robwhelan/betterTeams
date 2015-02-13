class DiscAssessment < ActiveRecord::Base
  belongs_to :user

  def assign_discs_to_user
    d=DiscAssessment.find(1)
    hash= {"Driver" => d.driver_score, "Influencer" => d.influencer_score, "Sociable" => d.sociable_score, "Conscientious" => d.conscientious_score}
    hash.sort_by{|k,v| v}.reverse
    
    array=array.sort.reverse
    
  end
end
