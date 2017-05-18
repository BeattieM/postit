# A topic shared by a User
class Post < ActiveRecord::Base
  include UniqueId
  acts_as_paranoid

  scope(:most_recent, -> { order('created_at desc') })

  belongs_to :author, foreign_key: 'user_id', class_name: User

  validates :author, :title, :body, presence: true

  delegate :display_name, to: :author, prefix: true

  paginates_per 5
end
