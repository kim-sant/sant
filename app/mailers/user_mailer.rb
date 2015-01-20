class UserMailer < ActionMailer::Base
  default from: "balance@idrinksant.com"
  
  def registration(user)
    @user = user
    mail(to: "#{user.email} <#{user.email}>", subject: "Registered")
  end
  
  def support_request(support_request)
    @request = support_request
    mail(to: "balance@idrinksant.com <balance@idrinksant.com>", subject: "New support request")
  end
end
