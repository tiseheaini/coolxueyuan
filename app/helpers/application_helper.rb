module ApplicationHelper
  def current_user
	  if session[:user_id]
	    @user = User.find(session[:user_id])
		else
		  return false
		end
	end

  def location(page_location)
    unless page_location.empty?
      html = ""
      html << content_tag(:span, '>', :class => 'dividr')
      html << content_tag(:span, page_location)
      html.html_safe
    end
  end
end
