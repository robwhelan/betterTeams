require 'test_helper'

class DiscAssessmentsControllerTest < ActionController::TestCase
  setup do
    @disc_assessment = disc_assessments(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:disc_assessments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create disc_assessment" do
    assert_difference('DiscAssessment.count') do
      post :create, disc_assessment: { conscientious_score: @disc_assessment.conscientious_score, driver_score: @disc_assessment.driver_score, influencer_score: @disc_assessment.influencer_score, sociable_score: @disc_assessment.sociable_score, user_id: @disc_assessment.user_id }
    end

    assert_redirected_to disc_assessment_path(assigns(:disc_assessment))
  end

  test "should show disc_assessment" do
    get :show, id: @disc_assessment
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @disc_assessment
    assert_response :success
  end

  test "should update disc_assessment" do
    patch :update, id: @disc_assessment, disc_assessment: { conscientious_score: @disc_assessment.conscientious_score, driver_score: @disc_assessment.driver_score, influencer_score: @disc_assessment.influencer_score, sociable_score: @disc_assessment.sociable_score, user_id: @disc_assessment.user_id }
    assert_redirected_to disc_assessment_path(assigns(:disc_assessment))
  end

  test "should destroy disc_assessment" do
    assert_difference('DiscAssessment.count', -1) do
      delete :destroy, id: @disc_assessment
    end

    assert_redirected_to disc_assessments_path
  end
end
