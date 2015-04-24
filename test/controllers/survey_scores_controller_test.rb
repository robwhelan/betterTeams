require 'test_helper'

class SurveyScoresControllerTest < ActionController::TestCase
  setup do
    @survey_score = survey_scores(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:survey_scores)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create survey_score" do
    assert_difference('SurveyScore.count') do
      post :create, survey_score: { comms_question_id: @survey_score.comms_question_id, comms_suvey_id: @survey_score.comms_suvey_id, score: @survey_score.score }
    end

    assert_redirected_to survey_score_path(assigns(:survey_score))
  end

  test "should show survey_score" do
    get :show, id: @survey_score
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @survey_score
    assert_response :success
  end

  test "should update survey_score" do
    patch :update, id: @survey_score, survey_score: { comms_question_id: @survey_score.comms_question_id, comms_suvey_id: @survey_score.comms_suvey_id, score: @survey_score.score }
    assert_redirected_to survey_score_path(assigns(:survey_score))
  end

  test "should destroy survey_score" do
    assert_difference('SurveyScore.count', -1) do
      delete :destroy, id: @survey_score
    end

    assert_redirected_to survey_scores_path
  end
end
