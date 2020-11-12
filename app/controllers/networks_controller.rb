class NetworksController < ApplicationController
  before_action :set_network, only: %i[show]

  def index
    @networks = Network.where(country: @country)

    expires_in 0.seconds, public: true
    fresh_when @networks
  end

  def show
    expires_in 0.seconds, public: true
    fresh_when @network
  end

  private

  def set_network
    @network = Network.find_by(slug: params[:slug])
  end
end
