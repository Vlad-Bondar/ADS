# frozen_string_literal: true

$LOAD_PATH << File.join(__dir__, 'lib')
require 'posts_method.rb'

class Post < ApplicationRecord
  POST_LIFETIME = 3.days

  include PgSearch::Model
  pg_search_scope :search_everywhere, against: %i[header body]

  validates :header, :body, presence: true
  belongs_to :user
  belongs_to :category

  mount_uploaders :images, AttachmentUploader

  accepts_nested_attributes_for :category, reject_if: :all_blank, allow_destroy: true

  # after_save :reindex

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
      post.archived! if Time.now - post.created_at >= POST_LIFETIME
    end
  end
end
#   private
#
#
#   def reindex
#     PgSearch::Multisearch.rebuild(Post)
#   end
# end
