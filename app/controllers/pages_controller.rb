class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :privacy]

  def home
  end

  def privacy
  end

  def redirect_to_privacy
    redirect_to privacy_path
  end
end
