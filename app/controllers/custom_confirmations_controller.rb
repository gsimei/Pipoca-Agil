
class CustomConfirmationsController < Devise::ConfirmationsController
  private

  def after_confirmation_path_for(resource_name, resource)
    # Redirecionar para a página inicial após a confirmação de e-mail
    home_path
  end
end

