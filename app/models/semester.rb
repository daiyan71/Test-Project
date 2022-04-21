class Semester < ApplicationRecord
    has_many :courses
    has_many :enrollments
    has_many :results
end
