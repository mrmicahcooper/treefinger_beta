class SessionsController < ApplicationController

  layout 'session'

  skip_before_filter :authenticate_user!, only: [:create, :new]

  expose(:email_or_username) { params[:email_or_username] }
  expose(:user) { User.find_by_email_or_username(email_or_username) || User.new }
  expose(:authenticated?) { user.persisted? && user.authenticate(params[:password]) }

  def create
    if authenticated?
      session[:user_id] = user.id
      redirect_to root_path
    else
      flash.now[:alert] = "invalid credentials"
      render 'pages/home'
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to :home
  end

end
