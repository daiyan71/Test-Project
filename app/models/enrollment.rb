class Enrollment < ApplicationRecord
  belongs_to :semester
  belongs_to :student
  belongs_to :course
end
