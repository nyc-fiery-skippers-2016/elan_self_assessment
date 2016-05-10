get '/tags' do
  @tags = Tag.all
  @tags_used = []
  erb :'/tags/show'
end

get '/posts/:id/tags/new' do
  @post_id = params[ :id ].to_i
  erb :'/tags/new'
end

post '/tags' do
  post = Post.where( id: params[:post_id] )
  post.first.tags << Tag.create( title: params[:tag] )
  redirect "/posts/#{ post.first.id }"
end

get '/tags/:tag_title' do
  @posts = []
  @tag = Tag.find_by( title: params[:tag_title] )
  Post.all.each do | post |
    tagged_post = post.tags.where(title: params[:tag_title])
    if !tagged_post.empty?
      @posts << post  if tagged_post.first.title == params[:tag_title]
    end
  end
  erb :'/posts/tagged_posts'
end

delete '/tags' do
  tag = Tag.find_by( id: params[:id] )
  tag.destroy
  redirect "/posts/#{ params[:post_id] }"
end
