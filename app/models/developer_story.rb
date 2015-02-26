class DeveloperStory < ActiveRecord::Base
  self.table_name = "stories_users"

  belongs_to :developer, class_name: "User",  foreign_key: "user_id"
  belongs_to :story

end
