class UserMailer < ActionMailer::Base
  default from: "drugscheduler477@gmail.com"

  def welcome_email(user)
    @user = user
    @url = "http://477drugs.herokuapp.com"
    mail(:to => user.email, :subject => "Welcome to Drugs Scheduler!")
  end
end
