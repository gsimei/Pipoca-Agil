class RegistrationsController < Devise::RegistrationsController
  def create
    build_resource(sign_up_params)

    resource.save
    yield resource if block_given?
    if resource.persisted?
      UserMailer.welcome(resource).deliver_now
      redirect_to confirmation_pending_path
    else
      clean_up_passwords resource
      set_minimum_password_length
      respond_with resource
    end
  end

  def redirect_to_privacy
    redirect_to privacy_path
  end
end
