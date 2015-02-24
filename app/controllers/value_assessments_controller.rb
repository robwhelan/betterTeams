class ValueAssessmentsController < ApplicationController
  before_action :set_value_assessment, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:show]

  # GET /value_assessments
  # GET /value_assessments.json
  def index
    @value_assessments = ValueAssessment.all
  end

  # GET /value_assessments/1
  # GET /value_assessments/1.json
  def show
  end

  # GET /value_assessments/new
  def new
    @value_assessment = ValueAssessment.new
  end

  # GET /value_assessments/1/edit
  def edit
  end

  # POST /value_assessments
  # POST /value_assessments.json
  def create
    @value_assessment = ValueAssessment.new(value_assessment_params)
    @value_assessment.save
    session[:value_assessment_id] = @value_assessment.id

    respond_to do |format|
      if @value_assessment.save
        if session[:assessment_sequence]
          format.html { redirect_to new_skill_assessment_path }
        else
          format.html { redirect_to @value_assessment, notice: 'Value assessment was successfully created.' }
          format.json { render :show, status: :created, location: @value_assessment }
        end
      else
        format.html { render :new }
        format.json { render json: @value_assessment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /value_assessments/1
  # PATCH/PUT /value_assessments/1.json
  def update
    respond_to do |format|
      if @value_assessment.update(value_assessment_params)
        format.html { redirect_to @value_assessment, notice: 'Value assessment was successfully updated.' }
        format.json { render :show, status: :ok, location: @value_assessment }
      else
        format.html { render :edit }
        format.json { render json: @value_assessment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /value_assessments/1
  # DELETE /value_assessments/1.json
  def destroy
    @value_assessment.destroy
    respond_to do |format|
      format.html { redirect_to value_assessments_url, notice: 'Value assessment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_value_assessment
      @value_assessment = ValueAssessment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def value_assessment_params
      params.require(:value_assessment).permit(:user_id, :aesthetic_score, :individualistic_score, :social_score, :theoretical_score, :traditional_score, :utilitarian_score)
    end
end
