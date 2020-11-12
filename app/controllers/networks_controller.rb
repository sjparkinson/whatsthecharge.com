class NetworksController < ApplicationController
  before_action :set_network, only: %i[show]

  def index
    @networks = Network.where(country: @country)

    fresh_when @networks, public: true
  end

  def show
    fresh_when @network, public: true
  end

  private

  def set_network
    @network = Network.find_by(slug: params[:slug])
  end
end
