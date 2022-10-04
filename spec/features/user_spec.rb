require 'rails_helper'
RSpec.describe 'Users Index/Show Page', type: :feature do
  before(:all) do
    @user_one = User.create(id: 3, name: 'Samuel', photo: 'https://avatars.githubusercontent.com/u/101924220?v=4',
                            bio: 'simplest of apps')

    visit users_path

    @post1 = Post.create(id: 26, title: 'Test Form Creation', text: 'Die Another Day', user: @user_one)
    @post2 = Post.create(id: 25, title: 'Happy', text: 'Die Another Day', user: @user_one)
    @post3 = Post.create(id: 24, title: 'Things Fall Apart', text: 'Die Another Day', user: @user_one)

    # visit user_path(@user_one.id)
  end

  describe 'User index page' do
    it 'Should show the username of all users ' do
      expect(page).to have_content('Tom')
      expect(page).to have_content('Lilly')
      expect(page).to have_content('Samuel')
    end

    it 'Should show the user photo for all users' do
      visit users_path
      expect(page).to have_selector("img[src='#{@user_one.photo}']")
    end

    it 'Should show the number of posts for each user has written' do
      visit users_path
      expect(page).to have_content('Number of posts: 6')
    end

    it 'Should redirect me to that user\'s posts page. ' do
      visit users_path
      click_on @user_one.name
      expect(page).to have_current_path user_path(@user_one)
    end
  end

  describe 'User show page' do
    it 'Should show the profile picture' do
      visit user_path(@user_one)
      expect(page).to have_selector("img[src='#{@user_one.photo}']")
    end

    it 'Should show username' do
      visit user_path(@user_one)
      expect(page).to have_content(@user_one.name)
    end

    it 'Should show the Number of posts' do
      visit users_path
      expect(page).to have_text('Number of posts: 6')
    end

    it 'Should show the user bio' do
      visit user_path(@user_one)
      expect(page).to have_content(@user_one.bio)
    end

    it 'shows the user\'s first 3 posts' do
      visit user_path(@user_one)
      expect(page).to have_content @post1.title
      expect(page).to have_content @post2.title
      expect(page).to have_content @post3.title
    end

    it 'shows the button that lets me view all of a user\'s posts' do
      visit user_path(@user_one)
      expect(page).to have_link 'See all posts'
    end

    it 'when title is clicked on a user post, it redirects me to that post\'s show page' do
      visit user_path(@user_one)
      click_link 'Things Fall Apart'
      expect(page).to have_current_path user_post_path(@user_one, @post3)
    end

    it 'When I click to see all posts, it redirects me to the user\'s post\'s index page' do
      visit user_path(@user_one)
      click_link 'See all posts'
      expect(page).to have_current_path user_posts_path(@user_one)
    end
  end
end
