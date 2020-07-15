class UsersController < ApplicationController
  #signup form
  def new
    @user = User.new
  end

  #signup users
  def create
  end

end
