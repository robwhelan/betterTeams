class ImprovementScoresController < ApplicationController
  before_action :set_improvement_score, only: [:show, :edit, :update, :destroy]

  # GET /improvement_scores
  # GET /improvement_scores.json
  def index
    @improvement_scores = ImprovementScore.all
  end

  # GET /improvement_scores/1
  # GET /improvement_scores/1.json
  def show
  end

  # GET /improvement_scores/new
  def new
    @improvement_score = ImprovementScore.new
  end

  # GET /improvement_scores/1/edit
  def edit
  end

  # POST /improvement_scores
  # POST /improvement_scores.json
  def create
    @improvement_score = ImprovementScore.new(improvement_score_params)

    respond_to do |format|
      if @improvement_score.save
        format.html { redirect_to @improvement_score, notice: 'Improvement score was successfully created.' }
        format.json { render :show, status: :created, location: @improvement_score }
      else
        format.html { render :new }
        format.json { render json: @improvement_score.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /improvement_scores/1
  # PATCH/PUT /improvement_scores/1.json
  def update
    respond_to do |format|
      if @improvement_score.update(improvement_score_params)
        format.html { redirect_to @improvement_score, notice: 'Improvement score was successfully updated.' }
        format.json { render :show, status: :ok, location: @improvement_score }
      else
        format.html { render :edit }
        format.json { render json: @improvement_score.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /improvement_scores/1
  # DELETE /improvement_scores/1.json
  def destroy
    @improvement_score.destroy
    respond_to do |format|
      format.html { redirect_to improvement_scores_url, notice: 'Improvement score was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_improvement_score
      @improvement_score = ImprovementScore.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def improvement_score_params
      params.require(:improvement_score).permit(:comms_question_id, :improvement_plan_id, :score)
    end
end
