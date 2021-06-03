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
        content_tag(:div, style: featured_img(category.articles.last.image_url).to_s,
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

  def show_category_format
    count_image = 2
    format_ = 'image-first'

    content = ''

    @articles.each do |article|

      case format_
        when 'image-first'
          content << category_image(article) + category_article(article)

          count_image -= 1
          format_ = 'details-first' if count_image.zero?
        when 'details-first'
          content << category_article(article) + category_image(article)

          count_image += 1
          format_ = 'image-first' if count_image == 2
      end

    end

    content.html_safe
  end

  def category_image(article)
    content_tag(:div, class: 'col-6 col-lg-3 p-0') do
      content_tag(:div, style: featured_img(article.image_url).to_s, 
                  class: 'categories-img-height background-img-setting position-relative') do end
    end
  end

  def category_article(article)
    content_tag(:div, class: 'col-6 col-lg-3 p-0 px-3 py-2 bg-light') do
      concat content_tag(:span, article.category.name,
                         class: 'border-bottom border-3 border-warning text-warning base-color fw-bolder pb-1')

      concat category_title(article)

      concat content_tag(:p, article.text, class: 'text-truncate')

      concat link_to 'Upvote', "/upvote/#{article.id}", class: 'btn base-bg-color text-white'
    end
  end

  def category_title(article)
    content_tag(:h5, class: 'mt-2') do
      link_to article.title, article, class: 'text-dark text-decoration-none'
    end
  end
end
