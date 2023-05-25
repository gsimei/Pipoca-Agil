class UserMailerPreview < ActionMailer::Preview
  def welcome
    user = User.first
    # Assim você passa o valor para params[:user] dentro da definição do mailer!
    UserMailer.with(user: user).welcome
  end
end
