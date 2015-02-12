require 'test_helper'

class TaskStatementsControllerTest < ActionController::TestCase
  setup do
    @task_statement = task_statements(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:task_statements)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create task_statement" do
    assert_difference('TaskStatement.count') do
      post :create, task_statement: { body: @task_statement.body, onet_id: @task_statement.onet_id }
    end

    assert_redirected_to task_statement_path(assigns(:task_statement))
  end

  test "should show task_statement" do
    get :show, id: @task_statement
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @task_statement
    assert_response :success
  end

  test "should update task_statement" do
    patch :update, id: @task_statement, task_statement: { body: @task_statement.body, onet_id: @task_statement.onet_id }
    assert_redirected_to task_statement_path(assigns(:task_statement))
  end

  test "should destroy task_statement" do
    assert_difference('TaskStatement.count', -1) do
      delete :destroy, id: @task_statement
    end

    assert_redirected_to task_statements_path
  end
end
