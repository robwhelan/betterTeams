class CommsQuestionsController < ApplicationController
  before_action :set_comms_question, only: [:show, :edit, :update, :destroy]

  # GET /comms_questions
  # GET /comms_questions.json
  def index
    @comms_questions = CommsQuestion.all
  end

  # GET /comms_questions/1
  # GET /comms_questions/1.json
  def show
  end

  # GET /comms_questions/new
  def new
    @comms_question = CommsQuestion.new
  end

  # GET /comms_questions/1/edit
  def edit
  end

  # POST /comms_questions
  # POST /comms_questions.json
  def create
    @comms_question = CommsQuestion.new(comms_question_params)

    respond_to do |format|
      if @comms_question.save
        format.html { redirect_to @comms_question, notice: 'Comms question was successfully created.' }
        format.json { render :show, status: :created, location: @comms_question }
      else
        format.html { render :new }
        format.json { render json: @comms_question.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /comms_questions/1
  # PATCH/PUT /comms_questions/1.json
  def update
    respond_to do |format|
      if @comms_question.update(comms_question_params)
        format.html { redirect_to @comms_question, notice: 'Comms question was successfully updated.' }
        format.json { render :show, status: :ok, location: @comms_question }
      else
        format.html { render :edit }
        format.json { render json: @comms_question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comms_questions/1
  # DELETE /comms_questions/1.json
  def destroy
    @comms_question.destroy
    respond_to do |format|
      format.html { redirect_to comms_questions_url, notice: 'Comms question was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comms_question
      @comms_question = CommsQuestion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comms_question_params
      params.require(:comms_question).permit(:body, :assessment_disc_id)
    end
end
