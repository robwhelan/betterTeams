require 'test_helper'

class SkillAssessmentsControllerTest < ActionController::TestCase
  setup do
    @skill_assessment = skill_assessments(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:skill_assessments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create skill_assessment" do
    assert_difference('SkillAssessment.count') do
      post :create, skill_assessment: { analytical_problem_solving_score: @skill_assessment.analytical_problem_solving_score, conflict_management_score: @skill_assessment.conflict_management_score, continuous_learning_score: @skill_assessment.continuous_learning_score, creativity_score: @skill_assessment.creativity_score, customer_service_score: @skill_assessment.customer_service_score, decision_making_score: @skill_assessment.decision_making_score, diplomacy_score: @skill_assessment.diplomacy_score, empathy_score: @skill_assessment.empathy_score, employee_development_score: @skill_assessment.employee_development_score, flexibility_score: @skill_assessment.flexibility_score, futuristic_thinking_score: @skill_assessment.futuristic_thinking_score, goal_orientation_score: @skill_assessment.goal_orientation_score, interpersonal_skills_score: @skill_assessment.interpersonal_skills_score, leadership_score: @skill_assessment.leadership_score, management_score: @skill_assessment.management_score, negotiation_score: @skill_assessment.negotiation_score, personal_effectiveness_score: @skill_assessment.personal_effectiveness_score, persuasion_score: @skill_assessment.persuasion_score, planning_score: @skill_assessment.planning_score, presenting_score: @skill_assessment.presenting_score, self_management_score: @skill_assessment.self_management_score, teamwork_score: @skill_assessment.teamwork_score, user_id: @skill_assessment.user_id, written_communication_score: @skill_assessment.written_communication_score }
    end

    assert_redirected_to skill_assessment_path(assigns(:skill_assessment))
  end

  test "should show skill_assessment" do
    get :show, id: @skill_assessment
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @skill_assessment
    assert_response :success
  end

  test "should update skill_assessment" do
    patch :update, id: @skill_assessment, skill_assessment: { analytical_problem_solving_score: @skill_assessment.analytical_problem_solving_score, conflict_management_score: @skill_assessment.conflict_management_score, continuous_learning_score: @skill_assessment.continuous_learning_score, creativity_score: @skill_assessment.creativity_score, customer_service_score: @skill_assessment.customer_service_score, decision_making_score: @skill_assessment.decision_making_score, diplomacy_score: @skill_assessment.diplomacy_score, empathy_score: @skill_assessment.empathy_score, employee_development_score: @skill_assessment.employee_development_score, flexibility_score: @skill_assessment.flexibility_score, futuristic_thinking_score: @skill_assessment.futuristic_thinking_score, goal_orientation_score: @skill_assessment.goal_orientation_score, interpersonal_skills_score: @skill_assessment.interpersonal_skills_score, leadership_score: @skill_assessment.leadership_score, management_score: @skill_assessment.management_score, negotiation_score: @skill_assessment.negotiation_score, personal_effectiveness_score: @skill_assessment.personal_effectiveness_score, persuasion_score: @skill_assessment.persuasion_score, planning_score: @skill_assessment.planning_score, presenting_score: @skill_assessment.presenting_score, self_management_score: @skill_assessment.self_management_score, teamwork_score: @skill_assessment.teamwork_score, user_id: @skill_assessment.user_id, written_communication_score: @skill_assessment.written_communication_score }
    assert_redirected_to skill_assessment_path(assigns(:skill_assessment))
  end

  test "should destroy skill_assessment" do
    assert_difference('SkillAssessment.count', -1) do
      delete :destroy, id: @skill_assessment
    end

    assert_redirected_to skill_assessments_path
  end
end
