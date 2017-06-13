class FarmaciaVerificator < ApplicationMailer
	default :from => 'App Medicamentos'
	  # envia el corroe en el momento que la farmacia es verificada
  def send_email(farmacium)
    @farmacium = farmacium
    mail( :to => @farmacium.correo,
    :subject => 'Su farmacia ha sido Registrada Satisfactoriamente.' )
  end
end

