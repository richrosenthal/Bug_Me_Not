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
      redirect_to user_path(@user)
    else
      render :new
    end
   end

   def show
    @user = User.find_by_id(params[:id]) #will send an error code vs if use find method
    redirect_to '/' if !@user #this is a failsafe incase someone messes with the dynamic route to an user that doesn't exist.  
   end

  #private method
private

 #adds strong params <- Don't forget this again....for real
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

end
