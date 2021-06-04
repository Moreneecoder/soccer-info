require 'rails_helper'

RSpec.describe 'Sign up', type: :feature do
  scenario 'register' do
    visit users_signup_url
    fill_in 'user_name', with: 'John Doe1'
    click_button 'Sign Up'
    sleep(3)
      
    user = User.find_by(name: 'JaneDoe')
    expect(current_path).to eq("/")
  end
end

RSpec.describe 'Sign in', type: :feature do
    let(:user) { User.create(name: 'JohnDoe2') }

    scenario 'login' do
      visit users_signin_url
      fill_in 'name', with: user.name
      click_button 'Sign In'
      sleep(3)
      expect(page).to have_content("You logged in successfully")
    end
end

RSpec.describe 'Top Writer', type: :feature do
    let(:user) { User.create(name: 'JohnDoe3') }

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

    scenario 'open and display top writer information' do
      vote = Vote.create(user_id: user.id, article_id: article.id)

      visit top_writer_url
      sleep(3)
      expect(page).to have_content('upvotes across all articles')
    end
end