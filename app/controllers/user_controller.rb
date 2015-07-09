get '/users/:id' do
  # only rendering partials
  if current_user.id == params[:id]
    erb :_user_private
  else
    erb :_user_public
  end
end
