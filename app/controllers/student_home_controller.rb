class StudentHomeController < ApplicationController
    before_action :authenticate_student!
    def home
        @crntt = Semester.find_by(current: 1)

        @result = Result.find_by(semester_id: @crntt, student_id: current_student.id)
    end

    def seeCourses
        @crntt = Semester.where(current: 1)
        @crntSemester = @crntt[0]
        @crnt = @crntt[0].id
        @Enrolled = Enrollment.where(semester_id: @crnt, student_id: current_student.id).select("course_id")
        @alreadyEnrolled = []
        @Enrolled.each do |e|
            @alreadyEnrolled << e.course_id
        end
        #@availableCourses = Course.where(semester_id: @crnt, "courseId LIKE ?","%"+params[:search]+"%")
        params[:search]="" if params[:search]==nil
        @availableCourses = Course.where("semester_id = ? and (courseId LIKE ? or courseName LIKE ?)",@crnt,"%"+params[:search]+"%","%"+params[:search]+"%")
        @result = Result.find_by(semester_id: @crnt, student_id: current_student.id)
    end

    def seeEnrolledCourses
        @crntt = Semester.where(current: 1)
        @crnt = @crntt[0].id
        
        @result = Result.find_by(semester_id: @crnt, student_id: current_student.id)
        @courses = Enrollment.where(semester_id: @crnt, student_id: current_student.id)
    end


end
