# frozen_string_literal: true
require '/home/vlad/twinslah/ADS/lib/posts_method.rb'

class PostsController < ApplicationController
  include PostsMethods
  before_action :authenticate_user!, except: %i[index show]
  before_action :set_post, only: %i[show edit update destroy]  

  def index
    #@posts = Post.includes(:user).where('status = ?', 'published').page(params[:page])
    @q = Post.ransack(params[:q])
    @posts = @q.result(distinct: true).where('status = ?', 'published').includes(:user).includes(:category).page(params[:page])
    
    respond_to do |format|
      format.html  #index.html.erb
      format.json { render json: @posts }
      format.js #index.js.erb
    end
    #byebug
  end

  def show; end

  def new
    @categories = Category.all
    #byebug
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
    #@post = Post.find(params[:id])
    authorize! :edit, @post
    @categories = Category.all
    @empty_category = find_empty_category
  end

  def update
    
    @post.status = params[:status]

    if @post.update(post_params)
      redirect_to '/posts/' + @post.id.to_s
    else
      render '/posts/' + @post.id.to_s + '/edit'
    end
  end

  def destroy
    
    @post.destroy
    redirect_to root_path
  end

  private

  def post_params
    params.require(:post).permit(:header, :body, :category_id, { images: [] }, category_attributes: [:title,:_destroy])
  end

  def set_post
    @post = Post.find(params[:id])
  end


end
