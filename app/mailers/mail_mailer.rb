class MailMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.mail_mailer.result_published.subject
  #
  def result_published
    @result = params[:result]
    @semester = @result.semester
    @student = @result.student
    @courses = Enrollment.where(semester_id: @semester.id, student_id: @student.id)
    @greeting = "Hi"

    mail from: "daiyanibrahim12@gmail.com",to: "hussain@nascenia.com" , subject: "Your result has been published"
  end
end
