json.array!(@skill_assessments) do |skill_assessment|
  json.extract! skill_assessment, :id, :user_id, :analytical_problem_solving_score, :conflict_management_score, :continuous_learning_score, :creativity_score, :customer_service_score, :decision_making_score, :diplomacy_score, :empathy_score, :employee_development_score, :flexibility_score, :futuristic_thinking_score, :goal_orientation_score, :interpersonal_skills_score, :leadership_score, :management_score, :negotiation_score, :personal_effectiveness_score, :persuasion_score, :planning_score, :presenting_score, :self_management_score, :teamwork_score, :written_communication_score
  json.url skill_assessment_url(skill_assessment, format: :json)
end
