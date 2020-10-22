class NetworksController < ApplicationController
  def index
    @networks = Network.where(country: @country)

    fresh_when @networks
  end
end
