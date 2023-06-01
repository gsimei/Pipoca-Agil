class TestMailer < ApplicationMailer
  def hello(user)
    @user = user
    mail(to: @user.email, subject: 'Hello from TestMailer')
  end
end

