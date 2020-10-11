class NetworksController < ApplicationController
  def index
    @networks = Network.all

    fresh_when @networks
  end

  def show
    @network = Network.includes(membership_plans: [ :charging_rates ], payg_plans: [ :charging_rates ])
      .find_by slug: params[:slug]

    @membership_plans = @network.membership_plans
    @payg_plans = @network.payg_plans

    fresh_when [@network, @network, @payg_plans]
  end
end
