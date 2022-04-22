# Preview all emails at http://localhost:3000/rails/mailers/mail_mailer
class MailMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/mail_mailer/result_published
  def result_published
    MailMailer.with(result: Result.first).result_published
  end

end
