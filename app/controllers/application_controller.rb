class ApplicationController < ActionController::Base
  protect_from_forgery

  def admin_only
    unless current_user and current_user.admin?
      flash[:error] = "Insufficient access privileges"
      redirect_to root_path
    end
  end
end
