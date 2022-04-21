class StudentHomeController < ApplicationController
    before_action :authenticate_student!
    def home
        @crntt = Semester.find_by(current: 1)
    end

    def seeCourses
        @crntt = Semester.where(current: 1)
        @crnt = @crntt[0].id
        @Enrolled = Enrollment.where(semester_id: @crnt, student_id: current_student.id).select("course_id")
        @alreadyEnrolled = []
        @Enrolled.each do |e|
            @alreadyEnrolled << e.course_id
        end
        @availableCourses = Course.where(semester_id: @crnt)
    end

    def seeEnrolledCourses
        @crntt = Semester.where(current: 1)
        @crnt = @crntt[0].id
        
        @courses = Enrollment.where(semester_id: @crnt, student_id: current_student.id)
    end


end
