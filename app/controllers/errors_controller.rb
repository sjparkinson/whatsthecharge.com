class ErrorsController < ApplicationController
  skip_before_action :set_current_country

  def not_found
    respond_to { |format| format.html { render status: 404 } }
  end

  def unprocessable_entity
    respond_to { |format| format.html { render status: 422 } }
  end

  def internal_server_error
    respond_to { |format| format.html { render status: 500 } }
  end
end
