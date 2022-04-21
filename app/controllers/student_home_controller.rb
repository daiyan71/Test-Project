class StudentHomeController < ApplicationController
    before_action :authenticate_student!
    def home 
    end

    def seeCourses
        @crnt = Semester.where(current: 1)
        @availableCourses = Course.where(semester_id: @crnt[0].id)
    end
end
