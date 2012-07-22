class ApplicationController < ActionController::Base

  protect_from_forgery

  before_filter :authenticate_user!

  expose(:current_user) { User.find_by_id(session[:user_id]) }
  expose(:projects) do
    if current_user.present?
      current_user.projects
    else
      []
    end
  end

  def authenticate_user!
    unless current_user.present?
      redirect_to :sign_up
    end
  end

  hide_action :authenticate_user!

end
