class GeneralMailer < ApplicationMailer
  default from: "me@unitconversion.tech"
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.general_mailer.feedback_notification.subject
  #
  def feedback_notification

    mail to: "ampatel2@gmail.com"
  end
end
