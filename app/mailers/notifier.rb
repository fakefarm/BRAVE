class Notifier <ActionMailer::Base
  default from: "dancardella@hotmail.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifier.invitation.subject
  #
  def invitation(agreement)
    @agreement = agreement

    mail to: "ajdeitrick@gmail.com"
  end
end


  