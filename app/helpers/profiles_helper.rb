module ProfilesHelper
  def profile_belongs_to_current_user?
    return false if current_user.username != params[:username]
    true
  end
end
