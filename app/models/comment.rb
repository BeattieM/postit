# A conversation on a Post or other Comment
class Comment < ActiveRecord::Base
  scope(:oldest, -> { order('created_at asc') })

  belongs_to :author, foreign_key: 'user_id', class_name: User
  belongs_to :post

  validates :author, :body, :post, presence: true

  delegate :display_name, to: :author, prefix: true
end
