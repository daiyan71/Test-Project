class AdminHomeController < ApplicationController
  def home
    @current = Semester.where(current: 1)
    @currentSemester = @current[0]
  end
  def allStudent
    @student = Student.all
  end
end
