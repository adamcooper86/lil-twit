get '/sessions/new' do
  erb :'sessions/new'
end

get '/sessions/delete' do
  erb :'sessions/delete'
end

post '/sessions' do
  if log_in
    redirect to "/user/#{@user.id}/timeline"
  else
    redirect to '/sessions/new'
  end
end

delete '/sessions' do
  log_out
  redirect to '/'
end
