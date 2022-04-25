class Semester < ApplicationRecord
    has_many :courses
    has_many :enrollments
    has_many :results

    before_destroy :ensure_not_referenced_by_any_child
    
    validates :name, presence: true
    validates :name, uniqueness: true

    private
    # ensure that there are no child referencing this semester
    def ensure_not_referenced_by_any_child
        unless enrollments.empty? && courses.empty? && results.empty?
            errors.add(:base, 'This semester has references')
            throw :abort
        end
    end
end
