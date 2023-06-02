class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :privacy]

  def home
    # Lógica para a página inicial
  end

  def privacy
    # Lógica para a página de política de privacidade
  end

  def redirect_to_privacy
    redirect_to privacy_path
  end
end
