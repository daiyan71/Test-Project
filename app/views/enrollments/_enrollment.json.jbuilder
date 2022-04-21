json.extract! enrollment, :id, :semester_id, :student_id, :course_id, :marks, :created_at, :updated_at
json.url enrollment_url(enrollment, format: :json)
