class Manage::PaygPlanCostsController < Manage::ManageController
  before_action :set_payg_plan, only: %i[index new edit create update]
  before_action :set_payg_plan_cost, only: %i[edit update destroy]

  def index
    @payg_plan_costs =
      PaygPlanCost.includes(payg_plan: %i[network])
        .where(payg_plan: @payg_plan)
        .order(ended_at: :desc)
  end

  def show; end

  def new
    @payg_plan_cost = PaygPlanCost.new
  end

  def create
    @payg_plan_cost = PaygPlanCost.new(payg_plan_cost_params)
    @payg_plan_cost.payg_plan = @payg_plan

    if @payg_plan_cost.save
      redirect_to manage_payg_plan_payg_plan_costs_path
    else
      render :new
    end
  end

  def edit; end

  def update
    if @payg_plan_cost.update(payg_plan_cost_params)
      redirect_to manage_payg_plan_payg_plan_costs_path
    else
      render :edit
    end
  end

  def destroy
    @payg_plan_cost.destroy
    redirect_to manage_payg_plan_payg_plan_costs_path
  end

  private

  def set_payg_plan
    @payg_plan = PaygPlan.find params[:payg_plan_id]
  end

  def set_payg_plan_cost
    @payg_plan_cost = PaygPlanCost.find params[:id]
  end

  def payg_plan_cost_params
    params.require(:payg_plan_cost).permit(
      :cost_per_kwh,
      :cost_per_kwh_currency,
      :cost_per_minute,
      :cost_per_minute_currency,
      :payg_plan_id,
      :ended_at
    )
  end
end
