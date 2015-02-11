class Story < ActiveRecord::Base
  validates :name, presence: true

  belongs_to :project
  belongs_to :signup_user, class_name: :user 

  has_and_belongs_to_many :developers, class_name: :user
end
