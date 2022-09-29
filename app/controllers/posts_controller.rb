class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts
  end

  def new
    @post = Post.new
    respond_to do |format|
      format.html { render :new, locals: {post: @post}  }
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :text).merge(user: current_user, comments_counter: 0, likes_counter: 0)
  end
  
  def create   
    respond_to do |format|
      format.html do
        @post = Post.new(post_params)
        if @post.save 
          flash[:success] = 'Post Have Been Saved'
          redirect_to user_post_path(current_user, @post)
        else 
          flash.now[:error] = 'Error: Post could not be saved'
          render :new, locals: { user: current_user, post: Post.new }
        end 
      end 
    end
  end
end
