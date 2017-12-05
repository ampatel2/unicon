# Preview all emails at http://localhost:3000/rails/mailers/general_mailer
class GeneralMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/general_mailer/feedback_notification
  def feedback_notification
    GeneralMailerMailer.feedback_notification
  end

end
