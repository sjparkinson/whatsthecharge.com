class NetworksController < ApplicationController
  before_action :set_network, only: %i[show]

  def index
    @networks = Network.where(country: @country).order(name: :desc)

    expires_in 0.seconds, public: true
    fresh_when etag: @networks
  end

  def show
    expires_in 0.seconds, public: true
    fresh_when etag: @network
  end

  private

  def set_network
    @network = Network.find_by(slug: params[:slug])
  end
end
