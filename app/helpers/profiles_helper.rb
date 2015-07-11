module ProfilesHelper
  def profile_belongs_to_current_user?
    return true if current_user && current_user.username == params[:username]
    false
  end
end
