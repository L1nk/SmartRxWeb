class UserMailerJob < Struct.new(:user, :alert)
  def perform
    UserMailer.send_alert_email(user, alert)
  end
end
