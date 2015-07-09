get '/users/new' do
  p "hello"
  erb :'users/new'
end

get '/users/:id' do
  @user = User.find(params[:id])
  if @user == current_user
    erb :'users/user_private'
  else
    erb :'users/user_public'
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
  redirect "/users/#{@user.id}/timeline"
end

# read
get '/users' do
  @users = User.all
  erb :'users/all_users'
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

# TIMELINE

get '/users/:id/timeline' do
  @user = User.find(params[:id])
  unless @user == current_user
    erb :user_error
  else
    erb :user_timeline
  end
end









