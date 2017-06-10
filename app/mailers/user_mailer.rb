class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.password_reset.subject
  #
  def password_reset(farmacium, password)
     @farmacium = farmacium
     @password = password
    mail( :to => farmacium.correo,
    :subject => 'Cambio de contraseña' )
  end
end
