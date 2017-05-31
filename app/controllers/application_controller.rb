class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def autenticacion
  	if session[:farmacia_id] == nil
      redirect_to '/login'
    else
   
    end
  end

  def current_user
    @current_user ||= Farmacium.find(session[:farmacia_id]) if session[:farmacia_id]
  end
  helper_method :current_user

  def authorize
    redirect_to '/login' unless current_user
  end
end
