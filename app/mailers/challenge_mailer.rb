class ChallengeMailer < ApplicationMailer
  def new_order_email
    mail(to: "pkgpt@yahoo.com", subject: "You got a new order!")
  end
end
