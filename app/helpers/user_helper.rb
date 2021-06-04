module UserHelper
  def render_top_writer
    if @votes.zero?
      content_tag(:div, class: 'alert alert-info') do
        content_tag :h4, "\u{2639} No Votes For Top Writer Yet!"
      end
    else
      render 'top_writer_details'
    end
  end
end
