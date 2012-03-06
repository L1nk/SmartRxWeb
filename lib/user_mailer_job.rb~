class UserMailerJob < Struct.new(:user, :alert)
  def perform
    UserMailer.alert_email(user, alert).deliver
  end
end
