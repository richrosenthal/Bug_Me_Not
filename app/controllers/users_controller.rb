class UsersController < ApplicationController
  #signup form
  def new
    @user = User.new
  end

  #signup users
  def create

    @user.save
  end

  #private method
  private

 #adds strong params <- Don't forget this again....for real 
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

end
