class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable
  belongs_to :project

  scope :developers, -> { where(role: ROLES[:developer]) }
  scope :admins, -> { where(role: ROLES[:admin]) }

  has_many :stories, through: :developer_stories
  has_many :developer_stories


  def is_admin?
    self.role == ROLES[:admin]
  end
end
