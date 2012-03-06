class UserMailer < ActionMailer::Base
  default from: "drugscheduler477@gmail.com"
  
  def welcome_email(user)
    @user = user
    @url = "http://477drugs.herokuapp.com"
    mail(:to => user.email, :subject => "Welcome to Drugs Scheduler!")
  end
  
  def alert_email(user, alert)
    @user = user
    @alert = alert
    
    Delayed::Job.enqueue(UserMailerJob.new(@user, @alert))
  end

  def send_alert_email(user, alert)
    @user = user
    @alert = alert

    puts "email: " + user.email
    
    mail(:to => user.email, :subject => "Alert!")
  end
end
