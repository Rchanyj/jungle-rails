class UserMailer < ApplicationMailer
  default from: 'no-reply@jungle.com'

  def receipt_email(order)
    @order = order
    @url = 'http://localhost:3000/orders'
    mail(to: @order.email, subject: "Order #{@order.id}: Your purchase receipt!")
  end
end
