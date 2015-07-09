get '/tweets' do
  @tweets = Tweet.all
  erb :'tweets/index'
end

get '/tweets/new' do
  erb :'tweets/new'
end

post '/tweets' do
  @tweet = Tweet.create(content: params[:content])
  if @tweet.persisted?
    redirect "/tweets/#{@tweet.id}"
  else
    status 400
    erb :'tweets/new'
  end
end

get '/tweets/:id' do
  @tweet = Tweet.where(id: params[:id]).first
  erb :'tweets/show'
end

get '/tweets/:id/edit' do
    @tweet = Tweet.where(id: params[:id]).first
    erb :'tweets/edit'
end

put '/tweets/:id' do
  @tweet = Tweet.find(params[:id])
  @tweet.update_attributes(content: params[:updated_content])
  @tweet.save
  erb :'tweets/show'
end

delete '/tweets/:id' do
  @tweet = Tweet.find(params[:id])
  @tweet.destroy
  redirect '/tweets'
end
