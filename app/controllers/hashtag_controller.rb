get '/hashtags' do
  @hashtags = Hashtag.all
  erb :'/hashtags/index'
end

get '/hashtags/:id' do
  @hashtag = Hashtag.where(id: params[:id]).first
  erb :'/hashtags/show'
end
