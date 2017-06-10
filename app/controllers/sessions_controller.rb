class SessionsController < ApplicationController
  before_action :set_session, only: [:show, :edit, :update, :destroy]

  
  # GET /sessions/new
  def new    
    session[:farmacia_id] = nil
  end

  def new_password
      render :template => "sessions/new_password"
  end
    def reset_password
      render :template => "sessions/reset_password"
  end


  # GET /sessions/1/edit
  def edit
  end

  # POST /sessions
  # POST /sessions.json
  def create
  
  user = Farmacium.where(correo: params[:correo]).first
  if user==nil
    redirect_to "/login", notice: 'Correo no se encuentra Registrado' 
  else
  if(user.verificado==false)
     redirect_to "/login", notice: 'Usuario no verificado' 
  else
    if user && user.authenticate(params[:password])
     # Save the farmacia id inside the browser cookie. This is how we keep the farmacia 
      # logged in when tey navigate arund our website.
      session[:farmacia_id] = user.id
      if user.correo == 'ADMIN'
         redirect_to '/laboratorios'
      else
          redirect_to '/lab_fars'
      end
    else
   # If farmacia's login doesn't work, send them back to the login form.
        redirect_to "/login", notice: 'Error de autenticacion' 
    end
   end
  end
end
 # Password reset rails
   def reset_password_update
     user = Farmacium.where(correo: params[:correo]).first
     if(user != nil)
    password_new = p SecureRandom.hex(10)
    password_reset = BCrypt::Password.create(password_new)
    Farmacium.where(correo: 'dgf-95@hotmail.com').update_all(password_digest: password_reset )
    # notificar a la farmacia por correo
      UserMailer.password_reset(user, password_new).deliver
     redirect_to "/reset_password", notice: 'Su contraseña fue enviada a su correo eléctronico.' 
     else
      redirect_to "/reset_password", notice: 'Este correo no se encuentra registrado' 
     end
  end

  def logout
    session[:farmacia_id] = nil
    redirect_to '/login'
  end
   # PATCH/PUT /farmacia/1
  # PATCH/PUT /farmacia/1.json
  def update_contrasena
     respond_to do |format|
    correo = current_user.correo
       user = Farmacium.where(correo: correo).first
     if user && user.authenticate(params[:password])
      new_password = BCrypt::Password.create(params[:new_password])     
       Farmacium.where(correo: current_user.correo).update_all(password_digest: new_password )       
        format.html { redirect_to "/change_password", notice: 'Contrasena actualizado con éxito.' }
    else
      format.html { redirect_to "/change_password", notice: 'Contrasena NO actualizado con éxito.' }
    end
    end
  end

  private
    

    # Never trust parameters from the scary internet, only allow the white list through.
    def session_params
       params.require(:sessions).permit(:correo, :password, :new_password)
    end
end
