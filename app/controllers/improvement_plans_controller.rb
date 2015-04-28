class ImprovementPlansController < ApplicationController
  before_action :set_improvement_plan, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /improvement_plans
  # GET /improvement_plans.json
  def index
    @improvement_plans = ImprovementPlan.all
  end

  # GET /improvement_plans/1
  # GET /improvement_plans/1.json
  def show
  end

  # GET /improvement_plans/new
  def new
    @improvement_plan = current_user.initiated_improvement_plans.new
    gon.users = User.with_names
  end

  # GET /improvement_plans/1/edit
  def edit
  end

  # POST /improvement_plans
  # POST /improvement_plans.json
  def create
    @improvement_plan = ImprovementPlan.new(improvement_plan_params)

    respond_to do |format|
      if @improvement_plan.save
        #initiate improvement plan sequence. @improvement_plan.initiate_emails()
        format.html { redirect_to @improvement_plan, notice: 'Improvement plan was successfully created.' }
        format.json { render :show, status: :created, location: @improvement_plan }
      else
        format.html { render :new }
        format.json { render json: @improvement_plan.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /improvement_plans/1
  # PATCH/PUT /improvement_plans/1.json
  def update
    respond_to do |format|
      if @improvement_plan.update(improvement_plan_params)
        format.html { redirect_to @improvement_plan, notice: 'Improvement plan was successfully updated.' }
        format.json { render :show, status: :ok, location: @improvement_plan }
      else
        format.html { render :edit }
        format.json { render json: @improvement_plan.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /improvement_plans/1
  # DELETE /improvement_plans/1.json
  def destroy
    @improvement_plan.destroy
    respond_to do |format|
      format.html { redirect_to improvement_plans_url, notice: 'Improvement plan was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_improvement_plan
      @improvement_plan = ImprovementPlan.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def improvement_plan_params
      params.require(:improvement_plan).permit(:initiator_id, :follower_id)
    end
end
