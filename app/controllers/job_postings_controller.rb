class JobPostingsController < ApplicationController
  before_action :set_job_posting, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /job_postings
  # GET /job_postings.json
  def index
    @job_postings = JobPosting.all
  end

  # GET /job_postings/1
  # GET /job_postings/1.json
  def show
  end

  # GET /job_postings/new
  def new
    @job_posting = current_user.job_postings.new
  end

  # GET /job_postings/1/edit
  def edit
  end

  # POST /job_postings
  # POST /job_postings.json
  def create
    @job_posting = JobPosting.new(job_posting_params)
    @job_posting.save
    @job_posting.assessment_discs<<AssessmentDisc.find(params[:disc_0])
    @job_posting.assessment_discs<<AssessmentDisc.find(params[:disc_1])
    @job_posting.assessment_values<<AssessmentValue.find(params[:values_0])
    @job_posting.assessment_values<<AssessmentValue.find(params[:values_1])
    @job_posting.assessment_values<<AssessmentValue.find(params[:values_2])
    @job_posting.assessment_skills<<AssessmentSkill.find(params[:skills_0])
    @job_posting.assessment_skills<<AssessmentSkill.find(params[:skills_1])
    @job_posting.assessment_skills<<AssessmentSkill.find(params[:skills_2])
    @job_posting.assessment_skills<<AssessmentSkill.find(params[:skills_3])
    @job_posting.assessment_skills<<AssessmentSkill.find(params[:skills_4])

    respond_to do |format|
      if @job_posting.save
        format.html { redirect_to @job_posting, notice: 'Job posting was successfully created.' }
        format.json { render :show, status: :created, location: @job_posting }
      else
        format.html { render :new }
        format.json { render json: @job_posting.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /job_postings/1
  # PATCH/PUT /job_postings/1.json
  def update
    respond_to do |format|
      if @job_posting.update(job_posting_params)
        format.html { redirect_to @job_posting, notice: 'Job posting was successfully updated.' }
        format.json { render :show, status: :ok, location: @job_posting }
      else
        format.html { render :edit }
        format.json { render json: @job_posting.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /job_postings/1
  # DELETE /job_postings/1.json
  def destroy
    @job_posting.destroy
    respond_to do |format|
      format.html { redirect_to job_postings_url, notice: 'Job posting was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_job_posting
      @job_posting = JobPosting.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def job_posting_params
      params.require(:job_posting).permit(:job_benchmark_id, :user_id, :title, :description, :task_01, :task_02, :task_03, :task_04,                                              :task_05, :task_06, :task_07, :task_08, :task_09, :task_10)
    end
end
