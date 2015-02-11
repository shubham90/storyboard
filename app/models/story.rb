class Story < ActiveRecord::Base
  validates :name, presence: true

  belongs_to :project
  belongs_to :signup_user, class_name: "User",  foreign_key: "signup_user_id" 

  has_and_belongs_to_many :users
end
