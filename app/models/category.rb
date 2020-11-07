# frozen_string_literal: true

class Category < ApplicationRecord
  has_many :posts
  validates :title , presence: true
end
=begin

  include PgSearch
  multisearchable against: :title

  after_save :reindex

  private

  def reindex
    PgSearch::Multisearch.rebuild(Category)
  end
end
=end
