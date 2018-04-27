class UserMailer < ApplicationMailer
  default from: 'notifications@example.com'

  def welcome_email(orders)
    @orders = orders
    @url  = 'http://example.com/login'
    mail(to: @orders.email, subject: 'Welcome to My Awesome Site')
  end
end