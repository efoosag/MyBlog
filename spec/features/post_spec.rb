require 'rails_helper'

RSpec.feature 'Posts Index/Show Page', type: :feature do
  before(:all) do
    @user_one = User.create(id: 3, name: 'Samuel', photo: 'https://avatars.githubusercontent.com/u/101924220?v=4',
                            bio: 'simplest of apps')

    @post1 = Post.create(id: 26, title: 'Test Form Creation', text: 'Very Good Jo', user: @user_one)
    @post2 = Post.create(id: 25, title: 'Happy', text: 'Very Good Jo', user: @user_one)
    @post3 = Post.create(id: 24, title: 'Things Fall Apart', text: 'Very Good Jo', user: @user_one)

    @comment1 = Comment.create(post: @post1, user: @user_one, text: 'Hi Tom!')
    @comment2 = Comment.create(post: @post1, user: @user_one,
                               text: 'Hola Tom!')
    @comment3 = Comment.create(post: @post1, user: @user_one,
                               text: 'Salam Tom!')
    @comment4 = Comment.create(post: @post1, user: @user_one,
                               text: 'Bonjour Tom!')
    @comment5 = Comment.create(post: @post1, user: @user_one,
                               text: 'Hello Tom!')

    visit user_posts_path(@user_one)
  end

  describe 'Post index page' do
    it 'shows the username' do
      expect(page).to have_content @user_one.name
    end

    it 'shows number of posts of user has written' do
      visit user_posts_path(@user_one)
      expect(page).to have_content('Number of posts: 6')
    end

    it 'shows the post\'s title' do
      visit user_posts_path(@user_one)
      expect(page).to have_content @post1.title
      expect(page).to have_content @post2.title
      expect(page).to have_content @post3.title
    end

    it 'shows some of the post\'s body' do
      visit user_posts_path(@user_one)
      expect(page).to have_content 'Sad'
      expect(page).to have_content 'Happy'
      expect(page).to have_content 'Hello'
    end

    it 'shows the first comments on a post' do
      visit user_posts_path(@user_one)
      expect(page).to have_content @comment1.text
    end

    it 'shows how many comments a post has' do
      expect(@post1.comments_counter).to eq(5)
    end

    it 'shows a section for pagination if there are more posts than fit on the view' do
      visit user_posts_path(@user_one)
      expect(page).to have_content 'Pagination'
    end

    it 'When I click on a post, it redirects me to that post\'s show page' do
      visit user_posts_path(@user_one)
      click_link @post2.title
      expect(page).to have_current_path user_post_path(@user_one, @post2)
    end
  end

  describe 'Post show page' do
    it 'shows the post title' do
      visit user_posts_path(@user_one, @post1)
      expect(page).to have_content @post1.title
    end

    it 'shows who wrote the post' do
      visit user_posts_path(@user_one, @post1)
      expect(page).to have_content @post1.user.name
    end

    it 'shows how many comments it has' do
      visit user_posts_path(@user_one, @post1)
      expect(@post1.comments_counter).to eq(5)
    end

    it 'shows how many likes it has' do
      visit user_posts_path(@user_one, @post1)
      expect(page).to have_content(@post1.likes_counter)
    end

    it 'shows the post body' do
      visit user_posts_path(@user_one, @post1)
      expect(page).to have_content @post1.text
    end

    it 'shows the username of each commentor' do
      visit user_posts_path(@user_one, @post1)
      expect(page).to have_content @comment1.user.name
      expect(page).to have_content @comment2.user.name
      expect(page).to have_content @comment3.user.name
    end

    it 'shows the comment each commentor left' do
      visit user_posts_path(@user_one, @post1)
      expect(page).to have_content @comment1.text
      expect(page).to have_content @comment2.text
      expect(page).to have_content @comment3.text
    end
  end
end
