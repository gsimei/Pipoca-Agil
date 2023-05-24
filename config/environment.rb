# Load the Rails application.
require_relative "application"

# Initialize the Rails application.
Rails.application.initialize!

ActionMailer::Base.smtp_settings = {
  # Remova as linhas relacionadas às credenciais de API do SendGrid
  :domain => 'localhost:3000',
  :address => 'smtp.sendgrid.net',
  :port => 587,
  :authentication => :plain,
  :enable_starttls_auto => true
}
