class Manage::NetworksController < Manage::ManageController
  before_action :set_network, only: %i[edit update destroy]

  def index
    @networks = Network.all.order(name: :asc)
  end

  def new
    @network = Network.new
  end

  def create
    @network = Network.new(network_params)

    if @network.save
      redirect_to manage_networks_path
    else
      render :new
    end
  end

  def edit; end

  def update
    if @network.update(network_params)
      redirect_to manage_networks_path
    else
      render :edit
    end
  end

  def destroy
    @network.destroy
    redirect_to manage_networks_path
  end

  private

  def set_network
    @network = Network.find(params[:id])
  end

  def network_params
    params.require(:network).permit(
      :name,
      :description,
      :slug,
      :website_url,
      :pricing_url,
      :android_app_url,
      :ios_app_url,
      :country_id
    )
  end
end
