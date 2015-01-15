class UserMailer < ActionMailer::Base
  default from: "bryon.finke@gmail.com"
  
  def registration(user)
    @user = user
    mail(to: "#{user.email} <#{user.email}>", subject: "Registered")
  end
  
  def support_request(support_request)
    @request = support_request
    mail(to: "klapaglia@idrinksant.com <klapaglia@idrinksant.com>", subject: "New support request")
  end
end
