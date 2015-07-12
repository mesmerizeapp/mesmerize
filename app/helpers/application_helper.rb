module ApplicationHelper
  def activate(action)
    action == params[:action] ? 'active' : ''
  end
end
