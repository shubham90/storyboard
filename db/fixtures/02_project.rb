Project.seed do |p|
  p.id    = 1
  p.name = "Project#1"
end

u = User.find(1)
u.project_id = 1
u.save!
