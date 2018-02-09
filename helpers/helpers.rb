helpers do
    def is_logged_in?
        cookies[:username] == nil ? (return false) : nil
        cookies[:cookie_key] == nil ? (return false) : nil
        
        user = User.find_by(username: cookies[:username])
        user.cookie_key == cookies[:cookie_key] ? true : false
    end
end