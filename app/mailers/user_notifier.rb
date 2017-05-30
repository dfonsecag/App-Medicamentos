class UserNotifier < ApplicationMailer
	default :from => 'App Medicamentos'

  # send a signup email to the user, pass in the user object that   contains the user's email address
  def send_signup_email(farmacium)
    @farmacium = farmacium
    mail( :to => @farmacium.correo,
    :subject => 'Mensaje bienvenida, registro App Medicamentos' )
  end
end
