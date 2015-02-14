class Project < ActiveRecord::Base
  validates :name, presence: true

  has_many :stories, dependent: :destroy
  has_many :users 

end
