class Comment < ActiveRecord::Base
  validates :text, presence: true

  # belongs_to :user, polymorphic: true
  # belongs_to :contact
  belongs_to :commentable, polymorphic: true
end
