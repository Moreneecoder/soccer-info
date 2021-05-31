module ApplicationHelper

  def all_categories
    Category.order('priority ASC')
  end

  def category_links(categories)
    content = ''
    categories.each do |category|
      content << content_tag(:li, class: 'nav-item') do
        link_to(category.name, category_path(category), class: 'nav-link fw-bolder')
      end
    end
    content.html_safe
  end

  def flash_message
    if flash[:notice]
      content_tag(:div, flash[:notice], class: 'alert alert-success')
    elsif flash[:alert]
      content_tag(:div, flash[:alert], class: 'alert alert-danger')
    end
  end

  def authentication_links
    content = ''
    if session[:user_id]
      content << content_tag(:li, class: 'nav-item border-end border-3 border-secondary d-flex align-items-center') do
        link_to 'LOGOUT', users_logout_path, class: 'nav-link fw-bolder'
      end

      content << content_tag(:li, class: 'nav-item d-flex align-items-center me-2') do
        link_to @current_user.name, '#' , class: 'nav-link fw-bolder'
      end

      content.html_safe
    else
      content << content_tag(:li, class: 'nav-item border-end border-3 border-secondary d-flex align-items-center') do
        link_to 'LOGIN', users_signin_path, class: 'nav-link fw-bolder'
      end

      content << content_tag(:li, class: 'nav-item d-flex align-items-center me-2') do
        link_to 'REGISTER', users_signup_path, class: 'nav-link fw-bolder'
      end

      content.html_safe
    end
  end
end
