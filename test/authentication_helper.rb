module AuthenticationHelper
  def login_as(user)
    post login_path,
         params: { session: { email: user.email, password: default_password } }
  end

  def default_password_digest
    cost =
      if ActiveModel::SecurePassword.min_cost
        BCrypt::Engine::MIN_COST
      else
        BCrypt::Engine.cost
      end
    BCrypt::Password.create(default_password, cost: cost)
  end

  def default_password
    'hunter2'
  end

  def logged_in?
    !session[:user_id].nil?
  end
end
