module LoginHelper
  def log_in(user)
    session[:user_id] = user.id
  end

  def logout(user)

  end
end
