module ArticleHelper
  def comment_title(article)
    unless article.comments.empty?
        content_tag(:div, 'Comments', class: 'fw-bolder base-color')
    end
  end
end
