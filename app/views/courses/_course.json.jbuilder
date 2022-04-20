json.extract! course, :id, :courseId, :courseName, :credit, :semester_id, :created_at, :updated_at
json.url course_url(course, format: :json)
