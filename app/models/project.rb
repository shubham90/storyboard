class Project < ActiveRecord::Base
  validates :name, presence: true

  has_many :stories
  has_many :developers, class_name: :user 

end
