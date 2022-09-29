class LikesController < ApplicationController
  def new
    @like = Like.new
    respond_to do |format|
      format.html { render :new, locals: {like: @like}  }
    end
  end
end