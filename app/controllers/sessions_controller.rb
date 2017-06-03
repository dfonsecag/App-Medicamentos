class SessionsController < ApplicationController
  before_action :set_session, only: [:show, :edit, :update, :destroy]

  
  # GET /sessions/new
  def new    
  end

  # GET /sessions/1/edit
  def edit
  end

  # POST /sessions
  # POST /sessions.json
  def create
  
  user = Farmacium.where(correo: params[:correo]).first
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


  def logout
    session[:farmacia_id] = nil
    redirect_to '/login'
  end

  private
    

    # Never trust parameters from the scary internet, only allow the white list through.
    def session_params
       params.require(:sessions).permit(:correo, :password)
    end
end
