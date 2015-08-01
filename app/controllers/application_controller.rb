class ApplicationController < ActionController::Base
  http_basic_authenticate_with name: ENV['SITE_USERNAME'], password: ENV['SITE_PASSWORD'] if ENV['SITE_USERNAME'].present? && ENV['SITE_PASSWORD'].present?

  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :ensure_signup_complete

  protected

  def ensure_signup_complete
    return if action_name == 'finish_signup'

    if current_user && !current_user.email_verified?
      redirect_to finish_signup_path(current_user)
    end
  end
end
