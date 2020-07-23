class SessionsController < ApplicationController
   def welcome
   end

   def destroy
    session.clear
    redirect_to '/'
   end

   def new

   end

   def create
     #does user exist?
     @user = User.find_by(username: params[:user][:username])
     #was user found? was password correct?
     if @user.try(:authenticate, params[:user][:password])
       session[:user_id] = @user.id
       redirect_to user_path(@user)
     else
       flash[:error] = "Either username or password was incorrect. Please try again"
       redirect_to login_path
     end
   end

   def omniauth

    @user = User.find_or_create_by(username: auth[:info][:email]) do |u|
       u.password = SecureRandom.hex
     end

      session[:user_id] = @user.id
      redirect_to user_path(@user)

   end

   private
     def auth
       request.env['omniauth.auth']
     end

end
