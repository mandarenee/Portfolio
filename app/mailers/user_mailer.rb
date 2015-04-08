class UserMailer < ApplicationMailer
  default from: 'mandakomrodrigues@gmail.com'

  def contact_me(user)
    @user = user
    @email = email
    @message = message
    mail(to: "mandareneekom@gmail.com",
         from: @email,
         subject: "Contact from #{@user}")
  end
end
