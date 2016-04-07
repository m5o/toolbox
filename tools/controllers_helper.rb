# encoding: UTF-8
module ControllersHelper

  def namespace?(*controller)
    controller.include?(params[:controller].split('/').first)
  end

  # TODO proof if this can be optimized with current_page?
  # http://api.rubyonrails.org/classes/ActionView/Helpers/UrlHelper.html#method-i-current_page-3F
  def controller?(*controller)
    controller.include?(params[:controller])
  end

  def action?(*action)
    action.include?(params[:action])
  end

  def is_active?(link_path, return_class = "active")
    current_page?(link_path) ? return_class : nil
  end

end
