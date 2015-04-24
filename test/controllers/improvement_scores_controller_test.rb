require 'test_helper'

class ImprovementScoresControllerTest < ActionController::TestCase
  setup do
    @improvement_score = improvement_scores(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:improvement_scores)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create improvement_score" do
    assert_difference('ImprovementScore.count') do
      post :create, improvement_score: { comms_question_id: @improvement_score.comms_question_id, improvement_plan_id: @improvement_score.improvement_plan_id, score: @improvement_score.score }
    end

    assert_redirected_to improvement_score_path(assigns(:improvement_score))
  end

  test "should show improvement_score" do
    get :show, id: @improvement_score
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @improvement_score
    assert_response :success
  end

  test "should update improvement_score" do
    patch :update, id: @improvement_score, improvement_score: { comms_question_id: @improvement_score.comms_question_id, improvement_plan_id: @improvement_score.improvement_plan_id, score: @improvement_score.score }
    assert_redirected_to improvement_score_path(assigns(:improvement_score))
  end

  test "should destroy improvement_score" do
    assert_difference('ImprovementScore.count', -1) do
      delete :destroy, id: @improvement_score
    end

    assert_redirected_to improvement_scores_path
  end
end
