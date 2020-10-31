class Manage::PaygPlansController < Manage::ManageController
  before_action :set_plan, only: %i[show edit update destroy]

  def index
    @plans = PaygPlan.all
  end

  def show
  end

  def new
    @plan = PaygPlan.new
  end

  def create
    @plan = PaygPlan.new(payg_plans_params)

    if @plan.save
      redirect_to manage_payg_plans_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @plan.update(plans_params)
      redirect_to manage_payg_plans_path
    else
      render :edit
    end
  end

  def destroy
    @plan.destroy
    redirect_to manage_payg_plans_path
  end

  private

  def set_plan
    @plan = PaygPlan.find params[:id]
  end

  def plans_params
    params.require(:payg_plan).permit(
      :name,
      :description,
      :network_id,
      :plan_url,
      :ended_at
    )
  end
end
