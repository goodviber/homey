# db/seeds.rb

# Create sample projects with string statuses
project1 = Project.create!(name: "Project Alpha", status: "open")
project2 = Project.create!(name: "Project Beta", status: "in_progress")

# Create or find some users (adjust attributes as needed)
user1 = User.find_or_create_by!(email: "user1@example.com") do |user|
  user.name = "User One"
end

user2 = User.find_or_create_by!(email: "user2@example.com") do |user|
  user.name = "User Two"
end

# Create a comment event for Project Alpha
project1.project_events.create!(
  user: user1,
  event_type: :comment,
  content: "This is a great project!"
)

# Create a status change event for Project Alpha: from "open" to "in_progress"
project1.project_events.create!(
  user: user2,
  event_type: :status_change,
  old_status: project1.status,      # captures "open"
  new_status: "in_progress"           # new status as a string
)
# Update the project's status to "in_progress"
project1.update!(status: "in_progress")

# Create a comment event for Project Beta
project2.project_events.create!(
  user: user1,
  event_type: :comment,
  content: "Let's kick off this project."
)
