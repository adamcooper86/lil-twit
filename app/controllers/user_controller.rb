get '/users/new' do
  p "hello"
  erb :'users/new'
end

get '/users/:id/timeline' do
  @user = User.find(params[:id])
  # @tweets = @user.tweets.reverse_order
  unless @user == current_user
    erb :user_error
  else
    erb :'users/user_timeline'
  end
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
  log_in @user
  p @user
  redirect "/users/#{@user.id}/timeline"
end

# read
get '/users' do
  @users = User.all
  erb :'users/all_users'
end

#update
put '/users/:id' do
  @user = User.find(params[:id])
  p @user
  p "#"*30
  @user.update_attributes(
              first_name: params[:first_name],
              last_name: params[:last_name],
              email: params[:email],
              city: params[:city],
              state: params[:state]
              )
  p @user
  @user.save
  redirect "/users/#{params[:id]}"
end

#delete
delete '/users/:id' do
  @user = User.find(current_user.id)
  log_out # log user out and then delete them from database
  User.destroy(@user.id)
  redirect '/'
end

post '/users/:id/tweets' do
  Tweet.create(user_id: params[:id], content: params[:content])
  redirect "/users/#{params[:id]}/timeline"
end

# TIMELINE

post '/users/:id/follow' do
  @user = User.find(params[:id])
  current_user.follow(@user)
  redirect "users/#{@user.id}"
end

post '/users/:id/unfollow' do
  @user = User.find(params[:id])
  current_user.unfollow(@user)
  redirect "users/#{@user.id}"
end












