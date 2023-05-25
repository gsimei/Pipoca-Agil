class RegistrationsController < Devise::RegistrationsController
  def create
    super do |resource|
      UserMailer.welcome(resource).deliver_now

      if resource.errors.empty?
        flash[:notice] = "Cadastro realizado com sucesso!"
        resource.send_confirmation_instructions
      else
        flash[:alert] = "Ocorreu um erro durante o cadastro. Verifique os dados informados."
      end
    end and return

    redirect_to root_path # Redirecionar para a página desejada após o cadastro
  end
end
