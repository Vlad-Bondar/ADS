class Post < ApplicationRecord
    validates :header,:body , presence: :true
    belongs_to :user
end
