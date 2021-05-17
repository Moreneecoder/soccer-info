require 'rails_helper'

RSpec.describe Article, type: :model do
  let(:user) { User.create!(name: 'FooBar') }
  let(:article) { user.build(title: 'A Title Forever', text: 'Roses Are Red, Somethings are blue', image: 'image.jpg') }
end
