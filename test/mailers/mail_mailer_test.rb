require 'test_helper'

class MailMailerTest < ActionMailer::TestCase
  test "result_published" do
    mail = MailMailer.result_published
    assert_equal "Result published", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
