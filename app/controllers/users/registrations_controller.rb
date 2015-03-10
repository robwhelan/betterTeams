class Users::RegistrationsController < Devise::RegistrationsController
  def create
    super
    if session[:assessment_sequence]
      disc = DiscAssessment.find(session[:disc_assessment_id])
      disc.update_attributes(:user_id => current_user.id)
      current_user.assign_discs_to_user
      
      value = ValueAssessment.find(session[:value_assessment_id])
      value.update_attributes(:user_id => current_user.id)
      current_user.assign_values_to_user      
      
      skill = SkillAssessment.find(session[:skill_assessment_id])
      skill.update_attributes(:user_id => current_user.id)
      current_user.assign_skills_to_user

    end
    session[:assessment_sequence] = "false"
    session[:disc_assessment_id] = nil
    session[:skill_assessment_id] = nil
    session[:value_assessment_id] = nil
  end
end