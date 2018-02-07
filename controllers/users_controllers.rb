get '/user/signup' do

  erb :"user/signup"
  
end

post '/user/signup' do
    
    cookies[:username] = nil
    
    if User.find_by(username: params[:username]) != nil || false
        "Sorry, that username is already taken. Please try again."
    else
        if params[:password] == params[:password_confirmation]
            User.create(username: params[:username], password:params[:password])
            cookies[:username] = params[:username]
            
            erb :"/user/welcome"
        else
            "Sorry, those passwords didn't match. Redirecting you back to signup page..."
        end
    end
    
end

get '/user/login' do
    
  if cookies[:username] == (nil || "")
      erb :"user/login"
  else 
      "You are already logged in, #{cookies[:username]}!"
  end
  
end

post '/user/login' do

  user = User.find_by(username: params[:username])
  
  if params[:password] == user.password
      
     cookies[:username] = params[:username]
    
     erb :"user/welcome"
    
  else
      
     "Sorry, that username and/or password doesn't exist in our database. Please try again."
     
  end

end

get '/user/logout' do
    
    cookies[:username] = nil
    
    erb :"user/logout"
    
end
    

post '/user/new' do
  
  erb :"user/new"
  
end