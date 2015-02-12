class TaskStatementsController < ApplicationController
  before_action :set_task_statement, only: [:show, :edit, :update, :destroy]

  # GET /task_statements
  # GET /task_statements.json
  def index
    @task_statements = TaskStatement.all
  end

  # GET /task_statements/1
  # GET /task_statements/1.json
  def show
  end

  # GET /task_statements/new
  def new
    @task_statement = TaskStatement.new
  end

  # GET /task_statements/1/edit
  def edit
  end

  # POST /task_statements
  # POST /task_statements.json
  def create
    @task_statement = TaskStatement.new(task_statement_params)

    respond_to do |format|
      if @task_statement.save
        format.html { redirect_to @task_statement, notice: 'Task statement was successfully created.' }
        format.json { render :show, status: :created, location: @task_statement }
      else
        format.html { render :new }
        format.json { render json: @task_statement.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /task_statements/1
  # PATCH/PUT /task_statements/1.json
  def update
    respond_to do |format|
      if @task_statement.update(task_statement_params)
        format.html { redirect_to @task_statement, notice: 'Task statement was successfully updated.' }
        format.json { render :show, status: :ok, location: @task_statement }
      else
        format.html { render :edit }
        format.json { render json: @task_statement.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /task_statements/1
  # DELETE /task_statements/1.json
  def destroy
    @task_statement.destroy
    respond_to do |format|
      format.html { redirect_to task_statements_url, notice: 'Task statement was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task_statement
      @task_statement = TaskStatement.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def task_statement_params
      params.require(:task_statement).permit(:onet_id, :body)
    end
end
