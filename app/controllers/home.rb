get '/home' do
  if logged_in?
    @posts = Post.all
    erb :'main/index'
  else
    redirect '/'
  end
end
