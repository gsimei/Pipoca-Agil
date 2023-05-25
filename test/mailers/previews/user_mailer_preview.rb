class UserMailerPreview < ActionMailer::Preview
  def welcome
    user = User.first
    # Chame o método welcome passando o objeto user como parâmetro
    UserMailer.welcome(user)
  end
end
