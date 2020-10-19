class Manage::PaygPlansController < Manage::ApplicationController
  before_action :set_payg_plan, only: [:show, :edit, :update, :destroy]

  def index
    @payg_plans = PaygPlan.all

    fresh_when @payg_plans
  end

  def show
    fresh_when @payg_plan
  end

  def new
    @payg_plan = PaygPlan.new
  end

  def create
    @payg_plan = PaygPlan.new(payg_plans_params)

    if @payg_plan.save
      redirect_to manage_payg_plans_path
    else
      render :new
    end
  end

  def edit
    fresh_when @payg_plan
  end

  def update
    if @payg_plan.update(payg_plans_params)
      redirect_to manage_payg_plans_path
    else
      render :edit
    end
  end

  def destroy
    @payg_plan.destroy
    redirect_to manage_payg_plans_path
  end

  private

  def set_payg_plan
    @payg_plan = PaygPlan.find(params[:id])
  end

  def payg_plans_params
    params.require(:payg_plan).permit(:name, :description, :network_id, :started_at, :ended_at)
  end
end
