module ApplicationHelper
  def activate(controller)
    controller == params[:controller] ? 'active' : ''
  end
end
