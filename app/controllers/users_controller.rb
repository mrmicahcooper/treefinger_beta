class UsersController < ApplicationController

  skip_before_filter :authenticate_user!, only: [:new, :create]

  layout 'session', only: [:new, :create]

  expose(:user)

  def create
    if user.save
      binding.pry
      session[:user_id] = user.id
      redirect_to root_path
    else
      render 'new'
    end
  end

end
