class DiscAssessmentsController < ApplicationController
  before_action :set_disc_assessment, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:show]

  # GET /disc_assessments
  # GET /disc_assessments.json
  def index
    @disc_assessments = DiscAssessment.all
  end

  # GET /disc_assessments/1
  # GET /disc_assessments/1.json
  def show
  end

  # GET /disc_assessments/new
  def new
    @disc_assessment = DiscAssessment.new
  end

  # GET /disc_assessments/1/edit
  def edit
  end

  # POST /disc_assessments
  # POST /disc_assessments.json
  def create
    @disc_assessment = DiscAssessment.new(disc_assessment_params)
    @disc_assessment.save
    session[:new_disc_assessment] = true
    session[:disc_assessment_id] = @disc_assessment.id
    respond_to do |format|
      if @disc_assessment.save
        format.html { redirect_to @disc_assessment, notice: 'Disc assessment was successfully created.' }
        format.json { render :show, status: :created, location: @disc_assessment }
      else
        format.html { render :new }
        format.json { render json: @disc_assessment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /disc_assessments/1
  # PATCH/PUT /disc_assessments/1.json
  def update
    respond_to do |format|
      if @disc_assessment.update(disc_assessment_params)
        format.html { redirect_to @disc_assessment, notice: 'Disc assessment was successfully updated.' }
        format.json { render :show, status: :ok, location: @disc_assessment }
      else
        format.html { render :edit }
        format.json { render json: @disc_assessment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /disc_assessments/1
  # DELETE /disc_assessments/1.json
  def destroy
    @disc_assessment.destroy
    respond_to do |format|
      format.html { redirect_to disc_assessments_url, notice: 'Disc assessment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_disc_assessment
      @disc_assessment = DiscAssessment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def disc_assessment_params
      params.require(:disc_assessment).permit(:user_id, :driver_score, :influencer_score, :sociable_score, :conscientious_score)
    end
end
