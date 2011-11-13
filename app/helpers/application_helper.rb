module ApplicationHelper
  def user_data_attributes(tag)
    if user_signed_in?
      attributes = " data-current-user-id='#{current_user.id}' data-current-user-name='#{current_user.name}'"
    else
      attributes = ''
    end
    
    "<#{tag}#{attributes}>".html_safe
  end
   def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end
end
