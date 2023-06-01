
class ConfirmationMailer < ApplicationMailer
  def welcome_email(user)
    @user = user
    @confirmation_link = confirmation_url(user.confirmation_token)
    mail(to: @user.email, subject: "Confirmação de Cadastro")
  end
end
