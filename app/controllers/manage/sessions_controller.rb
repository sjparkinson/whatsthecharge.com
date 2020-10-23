class Manage::SessionsController < Manage::ManageController
  skip_before_action :authorized

  def new
    redirect_to manage_path if logged_in?
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)

    if user && user.authenticate(params[:session][:password]) # Log the user in and redirect to the user's show page.
      reset_session
      login user
      redirect_to manage_path
    else
      redirect_to login_path
    end
  end

  def destroy
    logout
    redirect_to root_path
  end
end
