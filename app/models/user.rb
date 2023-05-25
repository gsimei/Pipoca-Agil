class User < ApplicationRecord

  # Devise modules
  devise :database_authenticatable, :registerable, :recoverable,
         :rememberable, :validatable, :omniauthable, omniauth_providers: [:google_oauth2, :facebook]
  devise :confirmable

  after_create :welcome_user

  private

  def welcome_user
    UserMailer.with(user: self)
  end


  # Validations
  validates :password, format: { with: /\A(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[!@#$%^&*]).{8,}\z/, message: "must include at least one letter, one number, and one special character" }
  validates :email, uniqueness: { message: "Este e-mail já está cadastrado em nosso sistema. Por favor, faça login com sua conta existente ou utilize um endereço de e-mail diferente." }
  validates :agree_terms, acceptance: { message: "Você deve concordar com a Política de Privacidade e Termos de Uso" }

  # Virtual attribute
  attr_accessor :show_password

  # Custom validation
  validate :validate_show_password

  def validate_show_password
    if show_password
      # Validar a senha aqui se necessário
    end
  end

  # Callback to send welcome email
  def send_welcome_email
    UserMailer.welcome(self).deliver_now
  end


  # Method to create a user from Google authentication
  def self.from_google(u)
    create_with(uid: u[:uid], name: u[:name], provider: 'google', password: Devise.friendly_token[0, 20]).find_or_create_by!(email: u[:email])
  end

  # Method to create a user from Facebook authentication
  def self.from_facebook(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
    end
  end
end
