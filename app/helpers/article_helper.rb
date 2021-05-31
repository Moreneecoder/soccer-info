module ArticleHelper
  def comment_title
    return if @article.comments.empty?

    content_tag(:div, 'Comments', class: 'fw-bolder base-color')
  end

  def display_comments
    content = ''
    @article.comments.each do |comment|
      content << content_tag(:div, class: 'card p-3 mb-3') do
        concat content_tag(:p, comment.user.name, class: 'fw-bolder mb-0')
        concat content_tag(:span, comment.body)
      end
    end
    content.html_safe
  end

  def display_comment_form
    if session[:user_id]
      render 'comment_form', article: @article
    else
      content_tag(:div, 'Log in/Register to comment', class: 'alert alert-info')
    end
  end
end
