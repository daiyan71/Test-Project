class Result < ApplicationRecord
  belongs_to :semester
  belongs_to :student
  validates :gpa, presence: true
end
