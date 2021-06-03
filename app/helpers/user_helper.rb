module UserHelper
  def render_top_writer
    if @votes.zero?
      content_tag(:div, class: 'alert alert-info') do
        content_tag :h4, '&#9785; No Votes For Top Writer Yet!'
      end
    end

    render 'top_writer_details' unless @votes.zero?
  end
end
