class ThanksMailer < ApplicationMailer
  default from: 'saeki.syusuke.infratop@gamil.com'

  def welcome_email(resource)
    @user = resource
    mail(to: @user.email)
  end
end
