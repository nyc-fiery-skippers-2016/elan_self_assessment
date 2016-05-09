get '/' do
  if logged_in?
    redirect '/home'
  else
    redirect '/login'
  end
end
