module ApplicationHelper
  def send_welcome_email(user)
    UserMailer.welcome(user).deliver
  end
end
