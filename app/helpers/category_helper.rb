module CategoryHelper
  def featured_img(img)
    "background-image: linear-gradient(to bottom, rgba(11, 11, 13, 0.3), rgba(0, 0, 0, 0.923)), url('#{img}')"
  end

  def featured_article
    return if @featured.nil?

    render 'featured'
  end

  def categories_display
    content = ''
    @categories.each do |category|
      next if category.articles.empty?

      content << content_tag(:div, class: 'col-6 col-lg-3 p-0') do
        content_tag(:div, 'style': featured_img(category.articles.last.image_url).to_s,
                          class: 'categories-img-height background-img-setting position-relative') do
                            
          category_display_name(category) + category_display_link(category)
          
        end
      end
    end

    content.html_safe
  end

  def category_display_name(category)
    content_tag(:span,
      class: 'category-name position-absolute border-bottom border-3 border-warning fw-bolder pb-1') do
        link_to category.name, category_path(category.id), class: 'text-white text-decoration-none'
    end
  end

  def category_display_link(category)
    content_tag(:span, class: 'category-title position-absolute text-white') do
      link_to category.articles.last.title, category.articles.last, class: 'text-white text-decoration-none'
    end
  end
end
