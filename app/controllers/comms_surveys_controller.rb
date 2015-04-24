class CommsSurveysController < ApplicationController
  before_action :set_comms_survey, only: [:show, :edit, :update, :destroy]

  # GET /comms_surveys
  # GET /comms_surveys.json
  def index
    @comms_surveys = CommsSurvey.all
  end

  # GET /comms_surveys/1
  # GET /comms_surveys/1.json
  def show
  end

  # GET /comms_surveys/new
  def new
    @comms_survey = CommsSurvey.new
  end

  # GET /comms_surveys/1/edit
  def edit
  end

  # POST /comms_surveys
  # POST /comms_surveys.json
  def create
    @comms_survey = CommsSurvey.new(comms_survey_params)

    respond_to do |format|
      if @comms_survey.save
        format.html { redirect_to @comms_survey, notice: 'Comms survey was successfully created.' }
        format.json { render :show, status: :created, location: @comms_survey }
      else
        format.html { render :new }
        format.json { render json: @comms_survey.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /comms_surveys/1
  # PATCH/PUT /comms_surveys/1.json
  def update
    respond_to do |format|
      if @comms_survey.update(comms_survey_params)
        format.html { redirect_to @comms_survey, notice: 'Comms survey was successfully updated.' }
        format.json { render :show, status: :ok, location: @comms_survey }
      else
        format.html { render :edit }
        format.json { render json: @comms_survey.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comms_surveys/1
  # DELETE /comms_surveys/1.json
  def destroy
    @comms_survey.destroy
    respond_to do |format|
      format.html { redirect_to comms_surveys_url, notice: 'Comms survey was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comms_survey
      @comms_survey = CommsSurvey.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comms_survey_params
      params.require(:comms_survey).permit(:improvement_plan_id, :name, :email, :user_id)
    end
end
