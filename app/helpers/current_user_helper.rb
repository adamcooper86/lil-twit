def current_user
  if session[:user_id]
    User.where(id: session[:user_id]).first
  end
end
