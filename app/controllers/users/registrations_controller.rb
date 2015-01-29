class Users::RegistrationsController < Devise::RegistrationsController
  def create
    super
    if session[:new_disc_assessment]
      disc = DiscAssessment.find(session[:disc_assessment_id])
      disc.update_attributes(:user_id => current_user.id)
    end
    session[:new_disc_assessment] = false
    session[:disc_assessment_id] = nil
  end
end