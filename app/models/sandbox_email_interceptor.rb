class SandboxEmailInterceptor
  def self.delivering_email(message)
    message.to = ['@order.email']
  end
end