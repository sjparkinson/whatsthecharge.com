class Manage::MembershipPlansController < Manage::ManageController
  before_action :set_membership_plan, only: %i[edit update destroy]

  def index
    @membership_plans = MembershipPlan.all
  end

  def new
    @membership_plan = MembershipPlan.new
  end

  def create
    @membership_plan = MembershipPlan.new(membership_plans_params)

    if @membership_plan.save
      redirect_to manage_membership_plans_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @membership_plan.update(membership_plans_params)
      redirect_to manage_membership_plans_path
    else
      render :edit
    end
  end

  def destroy
    @membership_plan.destroy
    redirect_to manage_membership_plans_path
  end

  private

  def set_membership_plan
    @membership_plan = MembershipPlan.find(params[:id])
  end

  def membership_plans_params
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
