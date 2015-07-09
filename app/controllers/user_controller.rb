get '/users/:id' do
  # only rendering partials
  if current_user.id == params[:id]
    erb :_user_private
  else
    erb :_user_public
  end
end

post '/users' do
  @user = User.create(username: params[:username],
              password: params[:password],
              first_name: params[:first_name],
              last_name: params[:last_name],
              email: params[:email],
              city: params[:city],
              state: params[:state]
              )
  login @user
  redirect "/users/#{@user.id}"
end
get '/users/new' do
  erb :'users/new'
end
