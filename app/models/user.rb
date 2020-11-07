# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :lockable,
         :recoverable, :rememberable, :validatable, :confirmable

  has_many :posts, dependent: :destroy
end
=begin
  

  include PgSearch
  multisearchable against: :user_name

  after_save :reindex

  private

  def reindex
    PgSearch::Multisearch.rebuild(User)
  end

end
=end