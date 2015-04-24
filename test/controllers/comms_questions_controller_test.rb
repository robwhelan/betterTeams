require 'test_helper'

class CommsQuestionsControllerTest < ActionController::TestCase
  setup do
    @comms_question = comms_questions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:comms_questions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create comms_question" do
    assert_difference('CommsQuestion.count') do
      post :create, comms_question: { assessment_disc_id: @comms_question.assessment_disc_id, body: @comms_question.body }
    end

    assert_redirected_to comms_question_path(assigns(:comms_question))
  end

  test "should show comms_question" do
    get :show, id: @comms_question
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @comms_question
    assert_response :success
  end

  test "should update comms_question" do
    patch :update, id: @comms_question, comms_question: { assessment_disc_id: @comms_question.assessment_disc_id, body: @comms_question.body }
    assert_redirected_to comms_question_path(assigns(:comms_question))
  end

  test "should destroy comms_question" do
    assert_difference('CommsQuestion.count', -1) do
      delete :destroy, id: @comms_question
    end

    assert_redirected_to comms_questions_path
  end
end
