class PagesController < ApplicationController
  skip_before_action :authenticate_user!
  skip_before_action :ensure_signup_complete

  def home
  end
end
