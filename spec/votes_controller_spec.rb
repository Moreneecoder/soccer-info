RSpec.describe 'UpVote', type: :feature do
  let(:user) { User.create!(name: 'JohnDoe5') }

  let(:author) { User.find_or_create_by(name: 'Lorem Ipsum') }
  let(:category) { Category.find_or_create_by(name: 'New Category', priority: 9) }
  let(:image_data) do
    "{\"id\":\"1bcd3150b5ed4ffe160e43cc39cc5dae.jpg\",\"storage\":\"store\",\"metadata\":{\"filename\":
    \"atletico-madrid.jpeg\",\"size\":32152,\"mime_type\":\"image/jpeg\",\"width\":930,\"height\":558}}"
  end

  let(:article) do
    Article.create(title: 'A Title Forever', text: 'Roses Are Red, Somethings are blue', image_data: image_data,
                   author_id: author.id, category_id: category.id)
  end

  scenario 'must have a unique author and article pair' do
    Vote.create!(user_id: user.id, article_id: article.id)
    validate = Vote.exists? user_id: user.id, article_id: article.id
    expect(validate).to be true
    expect(user.votes.count).to_not eq 0
  end
end
