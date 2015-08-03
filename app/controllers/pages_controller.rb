class PagesController < ApplicationController
  skip_before_action :authenticate_user!
  skip_before_action :ensure_signup_complete

  def home
    redirect_to feed_path if user_signed_in?
  end
end
