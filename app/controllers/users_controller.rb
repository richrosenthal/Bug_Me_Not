class UsersController < ApplicationController
  #signup form
  def new
    @user = User.new
  end

  #signup users
  def create
    @user = User.new(user_params)
    if @user.save
      #login the user
      session[:user_id] = @user.id
      #add a redirect path here
      #redirect_to users_path
    else
      render :new
    end
   end

  #private method
private

 #adds strong params <- Don't forget this again....for real
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

end
