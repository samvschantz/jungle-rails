class UserMailer < ApplicationMailer
  default from: 'notifications@example.com'

  def order_email(orders)
    @orders = orders
    @url  = 'http://example.com/login'
    mail(to: @orders.email, subject: "Order #{@orders.id}")
  end
end