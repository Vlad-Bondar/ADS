# frozen_string_literal: true

class Post < ApplicationRecord
  validates :header, :body, presence: true
  belongs_to :user
  belongs_to :category
  mount_uploaders :images, ImagesUploader

  accepts_nested_attributes_for :category, allow_destroy: true

  enum status: {
    draft: 'draft',
    new_post: 'new',
    rejected: 'rejected',
    approved: 'approved',
    published: 'published',
    archived: 'archived'
  }

  def self.publish_posts
    posts = Post.where('status = ?', Post.statuses[:approved])
    posts.each(&:published!)
  end

  def self.archive_posts
    posts = Post.where('status = ?', Post.statuses[:published])
    posts.each do |post|
      post.archived! if Time.now - post.created_at >= 3.days
    end
  end
end
