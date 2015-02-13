class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  belongs_to :project

  has_many :stories, through: :developer_stories
  has_many :developer_stories

  
  def is_admin?
    self.role == ROLES[:admin]
  end       
end
