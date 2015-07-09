get '/tweets' do
  @tweets = Tweet.all
  erb :'tweets/index'
end

get '/tweets/new' do
  erb :'tweets/new'
end

post '/tweets' do
  @tweet = Tweet.create(content: params[:content])
  # connect to user id?
  if @tweet.persisted?
    redirect "/:user_id/tweets"
  else
    status 400
    erb :new
  end
end

get 'tweets/:id' do
  @tweet = Tweet.where(id: params[:id]).first
  redirect '/tweets/#{params[:id]}'
end

get 'tweets/:id/edit' do
    @tweet = Tweet.where(id: params[:id]).first
    erb :edit
end

put '/tweets/:id' do
  @tweet = Tweet.find(params[:id])
  @tweet.update_attributes(content: params[:updated_content])
  @tweet.save
  redirect '/tweets'
end

delete '/tweets/:id' do
  @tweet = Tweet.find(params[:id])
  @tweet.destroy
  redirect '/tweets'
end
