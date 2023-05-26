
class RegistrationsController < Devise::RegistrationsController
  def create
    super do |user|
      UserMailer.welcome_email(user).deliver_now
    end
  end
end
