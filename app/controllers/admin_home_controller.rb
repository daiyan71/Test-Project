class AdminHomeController < ApplicationController
  before_action :authorize
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

  def updateMark
    
    @crntt = Semester.where(current: 1)
    @crnt = @crntt[0].id
    @crntStudentId = params[:id]
    @result = Result.find_by(semester_id: @crnt, student_id: @crntStudentId)
    @courses = Enrollment.where(semester_id: @crnt, student_id: @crntStudentId)
  end

  def publishResult
    stid= params[:result][:student_id]
    smid= params[:result][:semester_id]
    @courses = Enrollment.where(semester_id: smid, student_id: stid)

    gpa = 0
    grade = 0
    cnt = 0*1.0
    failed = false
    @courses.each do |c|
      cnt += c.course.credit
      if c.marks == nil
        failed = true
        break
      elsif c.marks <40
        grade = 0
      elsif c.marks >=40 && c.marks<45
        grade = 2.0
      elsif c.marks >=45 && c.marks<50
        grade = 2.25
      elsif c.marks >=50 && c.marks<55
        grade = 2.5
      elsif c.marks >=55 && c.marks<60
        grade = 2.75
      elsif c.marks >=60 && c.marks<65
        grade = 3.0
      elsif c.marks >=65 && c.marks<70
        grade = 3.25
      elsif c.marks >=70 && c.marks<75
        grade = 3.5
      elsif c.marks >=75 && c.marks<80
        grade = 3.75
      elsif c.marks >=80 && c.marks<101
        grade = 4.0
      end

      gpa = gpa + (grade*c.course.credit)
    end

    if failed == true
       redirect_to update_mark_url(stid), notice: "Unable to publish. Update all the marks" 
    else
      gpa = gpa/cnt
      @result = Result.new(semester_id: smid, student_id: stid, gpa: gpa)
      @result.save!
      MailMailer.with(result: @result).result_published.deliver_later
      redirect_to update_mark_url(stid), notice: "Successfully Published." 
      #added a comment
      #2nd line
    end

    # @result = Result.new(result_params)
    # respond_to do |format|
    #   if @result.save
    #     id= params[:result][:student_id]
    #     format.html { redirect_to update_mark_url(stid), notice: "Successfully Published." }
    #     format.json { render :show, status: :created, location: @result }
    #   else
    #     format.html { render :new, status: :unprocessable_entity }
    #     format.json { render json: @result.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  def result_params
    params.require(:result).permit(:semester_id, :student_id, :gpa)
  end
end
