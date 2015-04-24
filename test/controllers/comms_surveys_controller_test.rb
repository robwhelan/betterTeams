require 'test_helper'

class CommsSurveysControllerTest < ActionController::TestCase
  setup do
    @comms_survey = comms_surveys(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:comms_surveys)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create comms_survey" do
    assert_difference('CommsSurvey.count') do
      post :create, comms_survey: { email: @comms_survey.email, improvement_plan_id: @comms_survey.improvement_plan_id, name: @comms_survey.name, user_id: @comms_survey.user_id }
    end

    assert_redirected_to comms_survey_path(assigns(:comms_survey))
  end

  test "should show comms_survey" do
    get :show, id: @comms_survey
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @comms_survey
    assert_response :success
  end

  test "should update comms_survey" do
    patch :update, id: @comms_survey, comms_survey: { email: @comms_survey.email, improvement_plan_id: @comms_survey.improvement_plan_id, name: @comms_survey.name, user_id: @comms_survey.user_id }
    assert_redirected_to comms_survey_path(assigns(:comms_survey))
  end

  test "should destroy comms_survey" do
    assert_difference('CommsSurvey.count', -1) do
      delete :destroy, id: @comms_survey
    end

    assert_redirected_to comms_surveys_path
  end
end
