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
end
