class DietPlansController < ApplicationController
  def index
    @plans = DietPlan.all
  end

  def show
    @plan = DietPlan.find(params[:id])
  end

  def new
    @plan = DietPlan.new
  end

  def create
    @plan = DietPlan.new(diet_params)

    if @plan.save
      redirect_to diet_plans_path
    else
      # redirect_back fallback_location: root_path # baguhin pa later
      render :new
    end
  end

  def edit
    @plan = DietPlan.find(params[:id])
  end

  def update
    @plan = DietPlan.find(params[:id])

    if @plan.update
      redirect_to root_path
    else
      redirect_back fallback_location: root_path # baguhin pa later
    end
  end

  def destroy
    @plan = DietPlan.find(params[:id])
    @plan.destroy
    @plan.save

    # if @plan.save
    #   render diet_plans_path
    # end
  end

  private

  def diet_params
    params.require(:diet_plan).permit(:title, :description, :end_date)
  end
end
