class UserMailer < ApplicationMailer
  def welcome
    @user = params[:user] # Variável de instância => disponível na visualização
    mail(to: @user.email, subject: 'Welcome to Le Wagon')
    # Isso renderizará uma visualização em `app/views/user_mailer`!
  end
end
