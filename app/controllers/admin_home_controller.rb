class AdminHomeController < ApplicationController
  def home
    @current = Semester.where(current: 1)
    @currentSemester = @current[0]
  end
  def allStudent
    @student = Student.all
  end
  def selectCurrentSemester
    id= params[:id]
    Semester.update(current: 0)
    curnt = Semester.find(params[:id])
    curnt.update(current: 1)
    curnt.save!
    redirect_to semesters_url
  end
end
