# frozen_string_literal: true

# rubocop:disable Style/Documentation

module CategoryHelper
  def featured_img(img)
    "background-image: linear-gradient(to bottom, rgba(11, 11, 13, 0.3), rgba(0, 0, 0, 0.923)), url('#{img}')"
  end
end

# rubocop:enable Style/Documentation
