require 'test_helper'

class JobBenchmarksControllerTest < ActionController::TestCase
  setup do
    @job_benchmark = job_benchmarks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:job_benchmarks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create job_benchmark" do
    assert_difference('JobBenchmark.count') do
      post :create, job_benchmark: { description: @job_benchmark.description, title: @job_benchmark.title, user_id: @job_benchmark.user_id }
    end

    assert_redirected_to job_benchmark_path(assigns(:job_benchmark))
  end

  test "should show job_benchmark" do
    get :show, id: @job_benchmark
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @job_benchmark
    assert_response :success
  end

  test "should update job_benchmark" do
    patch :update, id: @job_benchmark, job_benchmark: { description: @job_benchmark.description, title: @job_benchmark.title, user_id: @job_benchmark.user_id }
    assert_redirected_to job_benchmark_path(assigns(:job_benchmark))
  end

  test "should destroy job_benchmark" do
    assert_difference('JobBenchmark.count', -1) do
      delete :destroy, id: @job_benchmark
    end

    assert_redirected_to job_benchmarks_path
  end
end
