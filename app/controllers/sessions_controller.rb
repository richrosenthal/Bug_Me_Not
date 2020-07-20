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
end
