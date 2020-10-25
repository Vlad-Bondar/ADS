# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]

  def index
    @posts = Post.includes(:user).where('status = ?', 'published').page(params[:page])

    # byebug
  end

  def show
    @post = Post.find(params[:id])

    # byebug
  end

  def new
    @categories = Category.all
    @post = Post.new
    authorize! :create, @post
    @post.build_category

    # byebug
  end

  def create
    @post = Post.new(post_params)
    # byebug
    @post.user_id = current_user.id

    @post.status = params[:status]

    if @post.save
      redirect_to '/posts/' + @post.id.to_s
    else
      render '/posts/new'
    end
  end

  def edit
    @post = Post.find(params[:id])
    authorize! :edit, @post
    @categories = Category.all
  end

  def update
    @post = Post.find(params[:id])
    @post.status = params[:status]

    if @post.update(post_params)
      redirect_to '/posts/' + @post.id.to_s
    else
      render '/posts/' + @post.id.to_s + '/edit'
    end
  end

  def user_posts
    @posts = User.find(current_user.id).posts.page(params[:page])
  end

  def posts_for_admin
    @posts = Post.where('status = ?', 'new_post').page(params[:page])
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to root_path
  end

  private

  def post_params
    params.require(:post).permit(:header, :body, :category_id, { images: [] }, category_attributes: [:title])
  end

  def change_post_status(status)
    if current_user.admin?
      status == Post.statuses[:rejected] ? Post.statuses[:rejected] : Post.statuses[:approved]
    else
      status ? Post.statuses[:new_post] : Post.statuses[:draft]
    end
  end
end
