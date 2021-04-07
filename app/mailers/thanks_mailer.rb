class ThanksMailer < ApplicationMailer
  default from: 'saeki.syusuke.infratop@gamil.com'

  def notify_user(user)
    @user = user
    mail(subject: '確認メール',to: user.email)
  end 
  
  def self.notify_users
    @users = User.all
    @users.each do |user|
      ThanksMailer.notify_user(user).deliver_now
    end 
  end 
end
