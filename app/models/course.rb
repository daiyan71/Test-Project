class Course < ApplicationRecord
  belongs_to :semester
  has_many :enrollments
end
