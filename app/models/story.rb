class Story < ActiveRecord::Base

  scope :assigned, ->(user) { self.is_user_assigned?(user) }
  validates :name, presence: true

  belongs_to :project
  belongs_to :signup_user, class_name: "User",  foreign_key: "signup_user_id" 

  has_many :developers, class_name: "User", through: :developer_stories
  has_many :developer_stories

  def is_user_assigned?(user)
    self.developers.exists?(user)
  end
end
