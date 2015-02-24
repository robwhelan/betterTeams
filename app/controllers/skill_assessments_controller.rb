class SkillAssessmentsController < ApplicationController
  before_action :set_skill_assessment, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:show]

  # GET /skill_assessments
  # GET /skill_assessments.json
  def index
    @skill_assessments = SkillAssessment.all
  end

  # GET /skill_assessments/1
  # GET /skill_assessments/1.json
  def show
  end

  # GET /skill_assessments/new
  def new
    @skill_assessment = SkillAssessment.new
  end

  # GET /skill_assessments/1/edit
  def edit
  end

  # POST /skill_assessments
  # POST /skill_assessments.json
  def create
    @skill_assessment = SkillAssessment.new(skill_assessment_params)
    @skill_assessment.save
    session[:skill_assessment_id] = @skill_assessment.id

    respond_to do |format|
      if @skill_assessment.save
        #probably need to send them over to some dashboard instead of the skill view.
        format.html { redirect_to pages_user_dashboard_path, notice: 'Skill assessment was successfully created.' }
        format.json { render :show, status: :created, location: @skill_assessment }
      else
        format.html { render :new }
        format.json { render json: @skill_assessment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /skill_assessments/1
  # PATCH/PUT /skill_assessments/1.json
  def update
    respond_to do |format|
      if @skill_assessment.update(skill_assessment_params)
        format.html { redirect_to @skill_assessment, notice: 'Skill assessment was successfully updated.' }
        format.json { render :show, status: :ok, location: @skill_assessment }
      else
        format.html { render :edit }
        format.json { render json: @skill_assessment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /skill_assessments/1
  # DELETE /skill_assessments/1.json
  def destroy
    @skill_assessment.destroy
    respond_to do |format|
      format.html { redirect_to skill_assessments_url, notice: 'Skill assessment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_skill_assessment
      @skill_assessment = SkillAssessment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def skill_assessment_params
      params.require(:skill_assessment).permit(:user_id, :analytical_problem_solving_score, :conflict_management_score, :continuous_learning_score, :creativity_score, :customer_service_score, :decision_making_score, :diplomacy_score, :empathy_score, :employee_development_score, :flexibility_score, :futuristic_thinking_score, :goal_orientation_score, :interpersonal_skills_score, :leadership_score, :management_score, :negotiation_score, :personal_effectiveness_score, :persuasion_score, :planning_score, :presenting_score, :self_management_score, :teamwork_score, :written_communication_score)
    end
end
