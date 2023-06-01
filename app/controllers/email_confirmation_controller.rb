class EmailConfirmationController < ApplicationController
  def confirm
    user = User.find_by_confirmation_token(params[:confirmation_token])

    if user.present? && !user.confirmed?
      user.confirm
      flash[:notice] = "Seu e-mail foi confirmado com sucesso!"
      redirect_to new_user_session_path
    else
      flash[:alert] = "Link de confirmação inválido."
      redirect_to root_path
    end
  end

  def send_confirmation_email_request
    user = User.find_by(email: params[:email])

    if user.present? && !user.confirmed?
      ConfirmationMailer.welcome_email(user).deliver_now
      flash[:notice] = "Enviamos um email de confirmação para você. Por favor, verifique sua caixa de entrada ou sua pasta de spam para concluir seu cadastro."
      redirect_to confirm_email_path(user.confirmation_token)
    else
      flash[:alert] = "Usuário não encontrado ou já confirmado."
      redirect_to root_path
    end
  end
end

