class Course < ApplicationRecord
  belongs_to :semester
  has_many :enrollments

  before_destroy :ensure_not_referenced_by_any_enrollment

  validates :courseId, :courseName, :credit, presence: true
  validates :courseId, :courseName, uniqueness: true

  private
  # ensure that there are no enrollment referencing this course
  def ensure_not_referenced_by_any_enrollment
    unless enrollments.empty?
      errors.add(:base, 'Some students erolled this course')
      throw :abort
    end
  end

end
