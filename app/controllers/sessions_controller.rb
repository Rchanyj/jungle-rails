class SessionsController < ApplicationController

  # TODO/DOING: use a safer method for redirects; figure out issue with sessions working
  # without an else condition (session storage)
  def new
    session[:prev] ||= request.referrer
    session[:rawprev] = request.referrer
    if session[:prev] != session[:rawprev] && session[:rawprev] != "http://localhost:3000/login"
      session[:realprev] = session[:rawprev]
    end
  end

  def create
    if user = User.authenticate_with_credentials(params[:email], params[:password])
      session[:user_id] = user.id
      redirect_to session.delete(:realprev)
    else
      flash[:notice] = "Whoops! Your entry doesn't match our records! Please make sure you filled everything out properly!"
      redirect_to '/login'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to (:back)
  end

end
