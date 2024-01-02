class ApplicationController < ActionController::Base

  private
  def check_user_signed_in?
    redirect_to new_user_session_path unless user_signed_in?
  end
end
