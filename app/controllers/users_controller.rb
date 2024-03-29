class UsersController < ApplicationController

  skip_before_filter :authenticate_user!, only: [:new, :create]

  layout 'session', only: [:new, :create]

  expose(:user)

  def create
    if user.save
      session[:user_id] = user.id
      user.create_sample_project
      redirect_to root_path
    else
      render 'pages/home'
    end
  end

end
