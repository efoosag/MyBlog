class CommentsController < ApplicationController
  def new
    @comment = Comment.new
    respond_to do |format|
      format.html { render :new, locals: {comment: @comment}  }
    end
  end

  def comment_params
    params.require(:comment).permit(:text).merge(user: current_user, post_id: params.require(:post_id))
  end
   
  def create   
    respond_to do |format|
      format.html do
        @comment = Comment.new(comment_params)
        if @comment.save 
          flash[:success] = 'Comment Have Been Saved'
          redirect_to user_post_path(current_user, @comment.post)
        else 
          flash.now[:error] = 'Error: Comment could not be saved'
          render :new, locals: { user: current_user, comment: Comment.new }
        end 
      end 
    end
  end
end