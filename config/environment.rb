# Load the Rails application.
require_relative "application"

# Initialize the Rails application.
Rails.application.initialize!

ActionMailer::Base.smtp_settings = {
  :user_name => 'apikey', # This is the string literal 'apikey', NOT the ID of your API key
  :password => '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', # Substitua 'NOVA_CHAVE_API' pela sua nova chave de API do SendGrid
  :domain => 'localhost:3000',
  :address => 'smtp.sendgrid.net',
  :port => 587,
  :authentication => :plain,
  :enable_starttls_auto => true
}
