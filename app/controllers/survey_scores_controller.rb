class SurveyScoresController < ApplicationController
  before_action :set_survey_score, only: [:show, :edit, :update, :destroy]

  # GET /survey_scores
  # GET /survey_scores.json
  def index
    @survey_scores = SurveyScore.all
  end

  # GET /survey_scores/1
  # GET /survey_scores/1.json
  def show
  end

  # GET /survey_scores/new
  def new
    @survey_score = SurveyScore.new
  end

  # GET /survey_scores/1/edit
  def edit
  end

  # POST /survey_scores
  # POST /survey_scores.json
  def create
    @survey_score = SurveyScore.new(survey_score_params)

    respond_to do |format|
      if @survey_score.save
        format.html { redirect_to @survey_score, notice: 'Survey score was successfully created.' }
        format.json { render :show, status: :created, location: @survey_score }
      else
        format.html { render :new }
        format.json { render json: @survey_score.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /survey_scores/1
  # PATCH/PUT /survey_scores/1.json
  def update
    respond_to do |format|
      if @survey_score.update(survey_score_params)
        format.html { redirect_to @survey_score, notice: 'Survey score was successfully updated.' }
        format.json { render :show, status: :ok, location: @survey_score }
      else
        format.html { render :edit }
        format.json { render json: @survey_score.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /survey_scores/1
  # DELETE /survey_scores/1.json
  def destroy
    @survey_score.destroy
    respond_to do |format|
      format.html { redirect_to survey_scores_url, notice: 'Survey score was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_survey_score
      @survey_score = SurveyScore.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def survey_score_params
      params.require(:survey_score).permit(:comms_question_id, :comms_suvey_id, :score)
    end
end
