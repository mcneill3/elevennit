class PostsController < ApplicationController
  before_action :find_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  def index
    @posts = Post.includes(:comment_threads).with_categories.with_user.page(params[:page])
  end

  def new
    @post = Post.new
    @post.post_type = params[:post_type] if params[:post_type].present?
  end

  def show
    @post = Post.find params[:id]
    @comment = Comment.build_from(@post, current_user.id, '')
  end

  def create
    @post = Post.new post_params
    @post.user_id = current_user.id
    if @post.save
      redirect_to posts_path, flash: { notice: 'It worked'}
    else
      flash.now[:error] = @post.errors.full_messages
      render :new
    end
  end

  def update
    if @post.update post_params
      redirect_to posts_path, flash: { notice: 'Your post was updated successfully.' }
    else
      flash.now[:error] = @post.errors.full_messages
      render :edit
    end
  end

  def destroy
    if @post.destroy
      redirect_to posts_path, flash: { notice: 'Your post has been removed.' }
    else
      redirect_to posts_path, flash: { notice: 'We were unable to remove that post.' }
    end
  end

    private

  def post_params
    params.require(:post).permit(:title, :link, :body, :post_type, :category_id)
  end

  def find_post
    @post = Post.find params[:id]
  end



end
