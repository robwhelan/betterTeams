class UserNotifier < ActionMailer::Base
  default from: "whelan@gmail.com"
  
  def send_follower_improvement_plan_notice(follower, initiator, improvement_plan)
      @follower = follower
      @initiator = initiator
      mail( :to => @follower.email,
      :subject => "You have been invited to participate in an improvement plan!" )
      @params = '?user=' + @follower.id.to_s + '&improvement_plan=' + improvement_plan.id.to_s
  end
    
end