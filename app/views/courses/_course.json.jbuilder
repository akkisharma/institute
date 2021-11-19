json.extract! course, :id, :name, :credits, :months_duration, :created_at, :updated_at
json.url course_url(course, format: :json)
