class ApplicationController < ActionController::Base
  http_basic_authenticate_with name: ENV['SITE_USERNAME'], password: ENV['SITE_PASSWORD'] if ENV['SITE_USERNAME'].present? && ENV['SITE_PASSWORD'].present?

  protect_from_forgery with: :exception
  before_action :authenticate_user!
end
