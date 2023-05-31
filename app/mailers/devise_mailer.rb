class DeviseMailer < Devise::Mailer
  def confirmation_instructions(record, token, opts={})
    @token = token
    @resource = record
    mail(to: record.email, subject: 'Confirme seu e-mail')
  end
end

