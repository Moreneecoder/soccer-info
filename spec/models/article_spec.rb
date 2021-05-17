require 'rails_helper'

RSpec.describe Article, type: :model do
  let(:user) { User.create!(name: 'FooBar') }
  let(:category) { Category.create!(name: 'Europe', priority: 1) }
  let(:article) { user.articles.build(title: 'A Title Forever', text: 'Roses Are Red, Somethings are blue', image: 'image.jpg', category_id: category.id) }

  describe 'validations:' do
    describe 'title' do
      it 'must be present' do
        expect(article).to be_valid

        article.title = nil
        expect(article).to_not be_valid
      end
    end

  end
end
