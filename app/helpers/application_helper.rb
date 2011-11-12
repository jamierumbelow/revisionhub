module ApplicationHelper
  def user_data_attributes(tag)
    if user_signed_in?
      attributes = " data-current-user-id='#{current_user.id}' data-current-user-name='#{current_user.name}'"
    else
      attributes = ''
    end
    
    "<#{tag}#{attributes}>".html_safe
  end
end
