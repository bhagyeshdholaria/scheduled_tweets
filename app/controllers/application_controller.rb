class ApplicationController < ActionController::Base
  before_action :set_current_user
  around_action :switch_time_zone, if: :current_user

  protected

  def switch_time_zone(&block)
    Time.use_zone(Current.user.time_zone, &block)
  end

  def set_current_user
    if session[:user_id]
      Current.user = User.find_by(id: session[:user_id])
    end
  end

  def current_user
    Current.user
  end

  def require_user_logged_in!
    redirect_to sign_in_path, alert: 'You must be signed in to do that.' if Current.user.nil?
  end
end
