get '/user/signup' do

  erb :"user/signup"
  
end

post '/user/signup' do
    
    cookies[:username] = nil
    
    if User.find_by(username: params[:username]) != nil || false
        "Sorry, that username is already taken. Please try again."
    else
        if params[:password] == params[:password_confirmation]
            cookie_key = SecureRandom.hex
            User.create(username: params[:username], password: params[:password],cookie_key: cookie_key)
            cookies[:cookie_key] = cookie_key
            cookies[:username] = params[:username]
            
            flash[:success] = "Thanks for signing up, cookies[:username]!"
            erb :"/questions/all"
        else
            "Sorry, those passwords didn't match. Redirecting you back to signup page..."
        end
    end
    
end

get '/user/login' do
    
  if (!User.find_by(username: cookies[:username])) || (cookies[:cookie_key] != User.find_by(username: cookies[:username]).cookie_key)
      erb :"/user/login"
  else
      "You are already logged in, #{cookies[:username]}!"
  end
  
end

post '/user/login' do

  user = User.find_by(username: params[:username])
  
  if user != nil && params[:password] == user.password
      
     cookies[:cookie_key] = user.cookie_key
     
     cookies[:username] = user.username
    
    flash.now[:message] = "You've sucessfully logged in. "
    erb :"questions/all"
    
  else
      
     flash.now[:message] = "Sorry, that username and/or password doesn't exist in our database. Please try again."
     erb :"/user/login"
     
  end

end

get '/user/logout' do
    
    cookies.clear
    flash.now[:message] = "You've been logged out. Come back soon!"
    erb :"questions/all"
    
end
    

post '/user/new' do
  
  erb :"user/new"
  
end
