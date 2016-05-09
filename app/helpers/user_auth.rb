# Nice use of helper file
def current_user
  @current_user ||= User.find_by( id: session[ :id ] )
end

def logged_in?
  !!current_user
end
