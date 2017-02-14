class ContactShare < ActiveRecord::Base
  validates :contact_id, :user_id, presence: true

  belongs_to :user, dependent: :destroy,
    class_name: :User,
    primary_key: :id,
    foreign_key: :user_id

  belongs_to :contact,
    class_name: :Contact,
    primary_key: :id,
    foreign_key: :contact_id


end
