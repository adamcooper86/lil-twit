get '/hashtags' do
  @hashtags = Hashtag.all
  erb :'/hashtags/index'
end

get '/hashtags/:id' do
  @hashtags = Hashtag.where(id: params[:id]).first
  erb :'/hashtags/show'
end
