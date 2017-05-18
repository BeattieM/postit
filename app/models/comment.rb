# A conversation on a Post or other Comment
class Comment < ActiveRecord::Base
  belongs_to :author, foreign_key: 'user_id', class_name: User
  belongs_to :post

  validates :author, :body, :post, presence: true

  delegate :display_name, to: :author, prefix: true
end