class SessionsController < ApplicationController

  skip_before_filter :authenticate_user!, only: [:create, :new]

  expose(:email) { params[:email] }
  expose(:user) { User.find_by_email(email) }
  expose(:authenticated?) { user.present? && user.authenticate(params[:password]) }

  def create
    if authenticated?
      session[:user_id] = user.id
      redirect_to root_path
    else
      redirect_to :sign_in, alert: 'invalid credentials'
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to :sign_in
  end

end
