require 'test_helper'

class ImprovementPlansControllerTest < ActionController::TestCase
  setup do
    @improvement_plan = improvement_plans(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:improvement_plans)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create improvement_plan" do
    assert_difference('ImprovementPlan.count') do
      post :create, improvement_plan: { follower_id: @improvement_plan.follower_id, initiator_id: @improvement_plan.initiator_id }
    end

    assert_redirected_to improvement_plan_path(assigns(:improvement_plan))
  end

  test "should show improvement_plan" do
    get :show, id: @improvement_plan
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @improvement_plan
    assert_response :success
  end

  test "should update improvement_plan" do
    patch :update, id: @improvement_plan, improvement_plan: { follower_id: @improvement_plan.follower_id, initiator_id: @improvement_plan.initiator_id }
    assert_redirected_to improvement_plan_path(assigns(:improvement_plan))
  end

  test "should destroy improvement_plan" do
    assert_difference('ImprovementPlan.count', -1) do
      delete :destroy, id: @improvement_plan
    end

    assert_redirected_to improvement_plans_path
  end
end
