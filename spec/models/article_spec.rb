require 'rails_helper'

RSpec.describe Article, type: :model do
  let(:user) { User.find_or_create_by(name: 'Lorem Ipsum') }
  let(:category) { Category.find_or_create_by(name: 'Europe', priority: 1) }
  let(:article) do
    user.articles.build(title: 'A Title Forever', text: 'Roses Are Red, Somethings are blue', image: 'image.jpg',
                        category_id: category.id)
  end

  describe 'validations:' do
    describe 'title' do
      it 'must be present' do
        article = user.articles.build(title: 'A Title Forever', text: 'Roses Are Red, Somethings are blue',
                                      image: 'image.jpg', category_id: category.id)
        expect(article).to be_valid

        article.title = nil
        expect(article).to_not be_valid
      end
    end

    describe 'text' do
      it 'must be present' do
        article = user.articles.build(title: 'A Title Forever', text: 'Roses Are Red, Somethings are blue',
                                      image: 'image.jpg', category_id: category.id)

        article.text = nil
        expect(article).to_not be_valid
      end
    end

    describe 'image' do
      it 'must be present' do
        article = user.articles.build(title: 'A Title Forever', text: 'Roses Are Red, Somethings are blue',
                                      image: 'image.jpg', category_id: category.id)

        article.image = nil
        expect(article).to_not be_valid
      end
    end

    describe 'category' do
      it 'must be present' do
        article.category_id = nil
        expect(article).to_not be_valid
      end
    end
  end

  describe 'associations:' do
    it 'has many votes' do
      article = Article.reflect_on_association(:votes)
      expect(article.macro).to eq(:has_many)
    end

    it 'belongs to an author' do
      article = Article.reflect_on_association(:author)
      expect(article.macro).to eq(:belongs_to)
    end

    it 'belongs to a category' do
      article = Article.reflect_on_association(:category)
      expect(article.macro).to eq(:belongs_to)
    end
  end
end
