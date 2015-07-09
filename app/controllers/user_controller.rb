get '/users/:id' do
  # only rendering partials
  if current_user.id == params[:id]
    erb :_user_private
  else
    erb :_user_public
  end
end

# create
post '/users' do
  @user = User.create(username: params[:username],
              password: params[:password],
              first_name: params[:first_name],
              last_name: params[:last_name],
              email: params[:email],
              city: params[:city],
              state: params[:state]
              )
  redirect "/users/#{@user.id}"
end
get '/users/new' do
  erb :'users/new'
end

# read
get '/users' do
  @users = User.all
  erb :all_users
end

#update
put 'users/:id' do
  @user = User.find(params[:id])
  @user.update_attributes(username: params[:username],
              password: params[:password],
              first_name: params[:first_name],
              last_name: params[:last_name],
              email: params[:email],
              city: params[:city],
              state: params[:state]
              )
  redirect "/users/#{params[:id]}"
end

#delete
delete '/users/:id' do
  @user = User.find(current_user.id)
  logout # log user out and then delete them from database
  User.destroy(@user.id)
  redirect '/'
end



