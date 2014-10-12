class UserMailer < ActionMailer::Base
  default from: "bryon.finke@gmail.com"
  
  def registration_confirmation(user)
    @user = user
    mail(:to => "#{user.email} <#{user.email}>", :subject => "Registered")
  end
end
