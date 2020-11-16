class Manage::MembershipPlansController < Manage::ManageController
  before_action :set_plan, only: %i[edit update destroy]

  def index
    @plans = MembershipPlan.all.order(network_id: :asc)
  end

  def new
    @plan = MembershipPlan.new
  end

  def create
    @plan = MembershipPlan.new(plan_params)

    if @plan.save
      redirect_to manage_membership_plans_path
    else
      render :new
    end
  end

  def edit; end

  def update
    if @plan.update(plan_params)
      redirect_to manage_membership_plans_path
    else
      render :edit
    end
  end

  def destroy
    @plan.destroy
    redirect_to manage_membership_plans_path
  end

  private

  def set_plan
    @plan = MembershipPlan.find params[:id]
  end

  def plan_params
    params.require(:membership_plan).permit(
      :name,
      :description,
      :network_id,
      :cost,
      :cost_currency,
      :cost_frequency,
      :plan_url,
      :ended_at
    )
  end
end
