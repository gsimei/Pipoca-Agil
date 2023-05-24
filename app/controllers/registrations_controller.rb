class RegistrationsController < Devise::RegistrationsController
  private

  def sign_up_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :date_of_birth)
  end

  def account_update_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :current_password, :date_of_birth)
  end
end
def create
  super do |resource|
    if resource.errors.empty?
      flash[:notice] = "Cadastro realizado com sucesso!"
      # Redirecionar para a página desejada
    else
      flash[:alert] = "Ocorreu um erro durante o cadastro. Verifique os dados informados."
      # Renderizar o formulário novamente com as mensagens de erro
    end
  end
end

