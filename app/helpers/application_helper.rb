module ApplicationHelper

  def all_categories
    Category.order('priority DESC')
  end

  def category_links(categories)
    content = ''
    @categories.each do |category|
      content << link_to(category.name, category_path(category), class: 'nav-link fw-bolder')
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
end
