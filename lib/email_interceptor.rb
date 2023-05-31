class EmailInterceptor
  def self.delivering_email(message)
    user_email = message.to.first
    message.subject = "#{message.to} #{message.subject}"
    message.to = [user_email]
  end
end

