get '/posts' do
  redirect '/'
end

get '/posts/new' do
  erb :'/posts/new'
end

post '/posts' do
  Post.create( title: params[:title], user_id: current_user.id, topic_id: session[ :topic_id ] )
  session.delete(:topic_id)
  redirect '/posts'
end

get '/posts/:id' do
  @post = Post.where( id: params[ :id ] )
  erb :'/posts/show'
end

delete '/posts' do
  post = Post.find_by( id: params[:post].to_i )
  post.destroy
  redirect '/posts'
end
