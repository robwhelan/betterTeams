class JobBenchmarksController < ApplicationController
  before_action :set_job_benchmark, only: [:show, :edit, :update, :destroy]

  # GET /job_benchmarks
  # GET /job_benchmarks.json
  def index
    @job_benchmarks = JobBenchmark.all
  end

  # GET /job_benchmarks/1
  # GET /job_benchmarks/1.json
  def show
  end

  # GET /job_benchmarks/new
  def new
    @job_benchmark = JobBenchmark.new
  end

  # GET /job_benchmarks/1/edit
  def edit
  end

  # POST /job_benchmarks
  # POST /job_benchmarks.json
  def create
    @job_benchmark = JobBenchmark.new(job_benchmark_params)

    respond_to do |format|
      if @job_benchmark.save
        format.html { redirect_to @job_benchmark, notice: 'Job benchmark was successfully created.' }
        format.json { render :show, status: :created, location: @job_benchmark }
      else
        format.html { render :new }
        format.json { render json: @job_benchmark.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /job_benchmarks/1
  # PATCH/PUT /job_benchmarks/1.json
  def update
    respond_to do |format|
      if @job_benchmark.update(job_benchmark_params)
        format.html { redirect_to @job_benchmark, notice: 'Job benchmark was successfully updated.' }
        format.json { render :show, status: :ok, location: @job_benchmark }
      else
        format.html { render :edit }
        format.json { render json: @job_benchmark.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /job_benchmarks/1
  # DELETE /job_benchmarks/1.json
  def destroy
    @job_benchmark.destroy
    respond_to do |format|
      format.html { redirect_to job_benchmarks_url, notice: 'Job benchmark was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  def return_benchmark_data
    @job_benchmark = JobBenchmark.find_by_name(params[:jobTitle])
    respond_to do |format|
      format.js
    end    
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_job_benchmark
      @job_benchmark = JobBenchmark.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def job_benchmark_params
      params.require(:job_benchmark).permit(:user_id, :title, :description)
    end
end
