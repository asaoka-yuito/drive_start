class PostsController < ApplicationController
  before_action :find_post, only: [:edit, :update, :destroy]

  def index
    @posts = Post.all.includes(:user).order(created_at: :desc)
  end

  def new
    @post = Post.new

    @maps = Map.all
    @map = Map.new
  end

  def create
    @maps = Map.all#あとでまとめて読み込ませる
    @map = Map.new
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to posts_path, success: t('defaults.message.create', item: Post.model_name.human)
    else
      flash.now['danger'] = t('defaults.message.not_create', item: Post.model_name.human)
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new #コメントの新規作成
    @comments = @post.comments.includes(:user).order(created_at: :desc)
  end

  def edit
    @maps = Map.all
    @map = Map.new
  end

  def update
    if @post.update(post_params)
      redirect_to @post, success: t('defaults.message.update.updated', item: Post.model_name.human)
    else
      flash.now['danger'] = t('defaults.message.update.not_updated', item: Post.model_name.human)
      render :edit
    end
  end

  def destroy
    @post.destroy!
    redirect_to posts_path, success: t('defaults.message.destory.deleted', item: Post.model_name.human)
  end

  def bookmarks
    @bookmarks_posts = current_user.bookmark_posts.includes(:user).order(created_at: :desc)
  end

  def map
    @maps = Map.all
    @map = Map.new
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end

  def find_post
    @post = current_user.posts.find(params[:id])
  end
end
