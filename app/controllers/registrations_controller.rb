
class RegistrationsController < Devise::RegistrationsController
  def create
    build_resource(sign_up_params)

    resource.save
    yield resource if block_given?
    if resource.persisted?
      UserMailer.welcome(resource).deliver_now
      set_flash_message! :notice, :signed_up_but_unconfirmed
      redirect_to confirmation_pending_path
    else
      clean_up_passwords resource
      set_minimum_password_length
      respond_with resource
    end
  end

  def confirmation_pending
    # Lógica da ação confirmation_pending
    # Renderizar a página de confirmação pendente com a mensagem e a logo do Pipoca Ágil
  end
end
