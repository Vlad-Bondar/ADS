# frozen_string_literal: true
require '/home/vlad/twinslah/ADS/lib/images_method.rb'

class ImagesController < ApplicationController
  include ImagesMethods
  before_action :set_posts_image

  def create
    if params[:post].blank?
      redirect_back(fallback_location: root_path)
    else
      add_more_images(images_params[:images])
      flash[:error] = 'Failed uploading images' unless @post.save
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    remove_image_at_index(params[:id].to_i)
    flash[:error] = 'Failed deleting image' unless @post.save
    redirect_back(fallback_location: root_path)
  end

  private

  def set_posts_image
    @post = Post.find(params[:post_id])
  end

  def images_params
    if params[:post].blank?
      redirect_back(fallback_location: root_path)
    else
      params.require(:post).permit({ images: [] })
    end
  end
end
