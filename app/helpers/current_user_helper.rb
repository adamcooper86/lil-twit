helpers do

  def current_user
    if session[:user_id]
      User.where(id: session[:user_id]).first
    end
  end

  def valid_log_in
    if params[:username] && params[:password]
      if user = User.where(username: params[:username]).first
        if user.password == params[:password]
          user
        end
      end
    end
  end

  def log_in user
    session[:user_id] = user.id
  end

  def log_out
    session[:user_id] = nil
  end

end
