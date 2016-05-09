get '/topics' do
  @topics = Topic.all
  erb :'/topics/index'
end

get '/topics/new' do
  erb :'/topics/new'
end

post '/topics' do
  current_user.topics << Topic.create( title: params[:title], user_id: current_user.id )
  redirect '/topics'
end

get '/topics/:username' do
  erb :'/topics/users/index'
end

get '/topics/:username/:id' do
  @topic = Topic.where( id: params[:id] )
  session[ :topic_id ] = @topic.first.id
  erb :'/topics/show'
end

delete '/topics' do
  topic = Topic.find_by( id: params[ :topic ].to_i )
  topic.destroy
  redirect '/topics'
end
