class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.all
    @post = Post.new
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    @posts = Post.all
    if @post.save
      @post.reload
      respond_to do |format|
        format.html { redirect_to posts_path }
        format.js  # <-- will render `app/views/reviews/create.js.erb`
      end
    else
      @post.reload
      respond_to do |format|
        format.html { render @posts }
        format.js  # <-- idem
      end
    end
  end

  def edit
  end

  def show
  end

  def update
    # @post.update(post_params)
    # redirect_to post_path(@point)
    @posts = Post.all
    if @post.update(post_params)
      @post.reload
      respond_to do |format|
        format.html { redirect_to posts_path }
        format.js  # <-- will render `app/views/reviews/create.js.erb`
      end
    else
      @post.reload
      respond_to do |format|
        format.html { render @posts }
        format.js  # <-- idem
      end
    end
  end

  def destroy
    @post.destroy
    respond_to do |format|
        format.html { redirect_to posts_path }
        format.js  # <-- will render `app/views/reviews/destroy.js.erb`
    end
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:name, :age, :message, :status, :photo, :photo_cache)
  end

end
