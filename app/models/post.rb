# frozen_string_literal: true

class Post < ApplicationRecord
  validates :header, :body , presence: true
  belongs_to :user
  belongs_to :category
 
  mount_uploaders :images , AttachmentUploader

  accepts_nested_attributes_for :category , reject_if: :all_blank
  

  enum status: {
    draft: 'draft',
    new_post: 'new_post',
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



