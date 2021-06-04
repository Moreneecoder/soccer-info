require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:user) { User.find_or_create_by(name: 'Lorem Insomnia') }
  let(:category) { Category.find_or_create_by(name: 'Some Category', priority: 7) }
  let(:image_data) do
    "{\"id\":\"1bcd3150b5ed4ffe160e43cc39cc5dae.jpg\",\"storage\":\"store\",\"metadata\":{\"filename\":
    \"atletico-madrid.jpeg\",\"size\":32152,\"mime_type\":\"image/jpeg\",\"width\":930,\"height\":558}}"
  end

  let(:article) do
    user.articles.build(title: 'A Title Forever', text: 'Roses Are Red, Somethings are blue', image_data: image_data,
                        category_id: category.id)
  end

  let(:comment) { article.comments.build(user_id: user.id, body: 'Hello Somebody') }

  describe 'validations' do
    describe 'body' do
      it 'must be present' do
        expect(comment).to be_valid

        comment.body = nil
        expect(comment).to_not be_valid
      end

      it 'must be not be more than 250 words' do
        body = 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Accusamus consequatur praesentium tempore,
        rerum eos in, perferendis, expedita deleniti nulla ducimus aut nihil harum maxime deserunt veritatis corrupti
        aliquam voluptatem? Recusandae sapiente adipisci architecto beatae minima dicta, animi rerum labore deserunt
         itaque, consequuntur voluptas? Quia eligendi'

        expect(comment).to be_valid

        comment.body = body
        expect(comment).to_not be_valid
      end
    end
  end

  describe 'associations:' do
    it 'belongs to a user' do
      comment = Comment.reflect_on_association(:user)
      expect(comment.macro).to eq(:belongs_to)
    end

    it 'belongs to an article' do
      comment = Comment.reflect_on_association(:article)
      expect(comment.macro).to eq(:belongs_to)
    end
  end
end
