require 'test_helper'

class ValueAssessmentsControllerTest < ActionController::TestCase
  setup do
    @value_assessment = value_assessments(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:value_assessments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create value_assessment" do
    assert_difference('ValueAssessment.count') do
      post :create, value_assessment: { aesthetic_score: @value_assessment.aesthetic_score, individualistic_score: @value_assessment.individualistic_score, social_score: @value_assessment.social_score, theoretical_score: @value_assessment.theoretical_score, traditional_score: @value_assessment.traditional_score, user_id: @value_assessment.user_id, utilitarian_score: @value_assessment.utilitarian_score }
    end

    assert_redirected_to value_assessment_path(assigns(:value_assessment))
  end

  test "should show value_assessment" do
    get :show, id: @value_assessment
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @value_assessment
    assert_response :success
  end

  test "should update value_assessment" do
    patch :update, id: @value_assessment, value_assessment: { aesthetic_score: @value_assessment.aesthetic_score, individualistic_score: @value_assessment.individualistic_score, social_score: @value_assessment.social_score, theoretical_score: @value_assessment.theoretical_score, traditional_score: @value_assessment.traditional_score, user_id: @value_assessment.user_id, utilitarian_score: @value_assessment.utilitarian_score }
    assert_redirected_to value_assessment_path(assigns(:value_assessment))
  end

  test "should destroy value_assessment" do
    assert_difference('ValueAssessment.count', -1) do
      delete :destroy, id: @value_assessment
    end

    assert_redirected_to value_assessments_path
  end
end
