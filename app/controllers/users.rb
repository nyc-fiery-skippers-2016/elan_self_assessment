get '/login' do
  if logged_in?
    redirect '/home'
  else
    erb :'/users/login'
  end
end

post '/users' do
  user = User.find_by( username: params[:user][:username] )
  if user && user.authenticate( params[:user][ :password ] )
    session[ :id ] = user.id
    redirect "/home"
  end
  @error = 'You entered either an incorrect username or password.'
  erb :'/users/login'
end

get '/users/new' do
  erb :'/users/new'
end

post '/users/new' do
  user = User.find_by( username: params[:user][:username] ) || User.find_by( email: params[:user][:email] )
  if user
    @user_exist_error = 'A user with this username and/or email already exists! Please log in below.'
    erb :'/users/new'
  else
    user = User.new( params[:user] )
    if user.save
      session[ :id ] = user.id
      redirect "/home"
    else
      @errors = user.errors.full_messages
      erb :'/users/new'
    end
  end
end

get '/logout' do
  session.clear
  redirect '/'
end
