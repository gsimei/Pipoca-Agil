
class UserMailer < ApplicationMailer
  def welcome_email(user)
    @user = user
    # Logic to send the welcome email to the user
    mail(to: 'ibson.pipocaagil@gmail.com', subject: 'Welcome to Pipoca Agil')
  end
end
