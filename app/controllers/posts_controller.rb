class PostsController < ApplicationController
  before_action :set_post, only: [:show]

  def show
  end

  private
  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :content, :image)
  end
end
