get '/sessions/new' do
  erb :'sessions/new'
end

get '/sessions/delete' do
  erb :'sessions/delete'
end

post '/sessions' do
  if params[:username] && params[:password]
    if @user = User.where(username: params[:username]).first
      if @user.password == params[:password]
        session[:user_id] = @user.id
        redirect to "/user/#{@user.id}/timeline"
      end
    end
  end
  redirect to '/sessions/new'
end

delete '/sessions' do
  session[:user_id] = nil
  redirect to '/'
end
