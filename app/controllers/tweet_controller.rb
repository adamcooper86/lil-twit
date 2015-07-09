get '/tweets' do
  @tweets = Tweet.all
  erb :'tweets/index'
end

get '/tweets/new' do
  erb :new
end

post ':user_id/tweets' do
  @tweet = Tweet.create(content: params[:content])
  # connect to user id?
  if @tweet.persisted?
    redirect "/:user_id/tweets"
  else
    status 400
    erb :new
  end
end

get ':user_id/tweets/:id' do
  @tweet = Tweet.where(id: params[:id]).first
  redirect '/:user_id/tweets/#{params[:id]}'
end

get ':user_id/tweets/:id/edit' do
    @tweet = Tweet.where(id: params[:id]).first
    erb :edit
end

put ':user_id/tweets/:id' do
  @tweet = Tweet.find(params[:id])
  @tweet.update_attributes(content: params[:updated_content])
  @tweet.save
  redirect ':user_id/tweets'
end

delete ':user_id/tweets/:id' do
  @tweet = Tweet.find(params[:id])
  @tweet.destroy
  redirect ':user_id/tweets'
end
