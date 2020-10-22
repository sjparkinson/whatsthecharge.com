class Manage::CountriesController < Manage::ApplicationController
  before_action :set_country, only: %i[edit update destroy]

  def index
    @countries = Country.all.select(:id, :name, :countryCode)

    fresh_when @countries
  end

  def new
    @country = Country.new
  end

  def create
    @country = Country.new(country_params)

    if @country.save
      redirect_to manage_countries_path
    else
      render :new
    end
  end

  def edit
    fresh_when @country
  end

  def update
    if @country.update(country_params)
      redirect_to manage_countries_path
    else
      render :edit
    end
  end

  def destroy
    if @country.destroy
      redirect_to manage_countries_path
    else
      head :bad_request
    end
  end

  private

  def set_country
    @country = Country.find(params[:id])
  end

  def country_params
    params.require(:country).permit(:name, :countryCode)
  end
end
