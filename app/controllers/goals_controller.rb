class GoalsController < ApplicationController
  before_action :set_goal, only: [:show, :edit, :update, :destroy, :set_fact_day, :update_fact_day]
  before_action :authenticate_user!

  after_action :set_visible, only: [:create]

  # GET /goals
  # GET /goals.json
  def index
    @goals = current_user.goals
  end

  # GET /goals/1
  # GET /goals/1.json
  def show
  end

  def set_fact_day
  end

  # GET /goals/new
  def new
    @goal = Goal.new
  end

  # GET /goals/1/edit
  def edit
  end

  # POST /goals
  # POST /goals.json
  def create
    @goal = current_user.goals.build(goal_params)

    respond_to do |format|
      if @goal.save
        format.html { redirect_to @goal, notice: 'Цель создана, успехов.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /goals/1
  # PATCH/PUT /goals/1.json
  def update
    respond_to do |format|
      if @goal.update(goal_params)
        format.html { redirect_to goals_path, notice: 'Цель успешно изменена.' }
      else
        format.html { render :edit }
      end
    end
  end

  def update_fact_day
    respond_to do |format|
      if @goal.update(goal_params) && @goal.valid?(:fact_days_check)
        @goal.update(visibility: false)
        format.html { redirect_to goals_path, notice: 'Цель успешно заархивирована' }
      else
        format.html { render :set_fact_day }
      end
    end
  end

  # DELETE /goals/1
  # DELETE /goals/1.json
  def destroy
    @goal.destroy
    respond_to do |format|
      format.html { redirect_to goals_url, notice: 'Цель уничтожена.' }
      format.json { head :no_content }
    end
  end



  private
    def set_goal
      @goal = Goal.find(params[:id])
    end

    def goal_params
      if params[:update_fact_days]
        params.require(:goal).permit(:fact_days)
      else
        params.require(:goal).permit(:title, :optimal_days, :normal_days, :pessimistic_days)
      end
    end

    def set_visible
      @goal.update(visibility: true)
    end
end
