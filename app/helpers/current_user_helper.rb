helpers do

  def current_user
    if session[:user_id]
      User.where(id: session[:user_id]).first
    end
  end

  def log_in
    if params[:username] && params[:password]
      if user = User.where(username: params[:username]).first
        if user.password == params[:password]
          session[:user_id] = user.id
          true
        end
      end
    end
    false
  end

  def log_out
    session[:user_id] = nil
  end

end
