# frozen_string_literal: true

class PostsController < ApplicationController
  # ##########################################22222222222222222222222222########################################

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
    @post.build_category
    # byebug
  end

  def create
    byebug
    @post = Post.new(post_params)

    # byebug
    @post.user_id = current_user.id
    @post.published!
    if @post.save
      redirect_to '/posts/' + @post.id.to_s
    else
      render '/posts/new'
    end
  end

  def edit
    @post = Post.find(params[:id])
    @categories = Category.all
  end

  def update
    @post = Post.find(params[:id])
    # byebug
    redirect_to '/posts/' + @post.id.to_s if @post.update(post_params)
  end

  def user_posts
    @posts=Post.where("user_id=?",current_user.id).page(params[:page])
  end

  def delete; end

  private

  def post_params
    params.require(:post).permit(:header, :body, :category_id, { images: [] }, category_attributes: [:title])
  end

end
