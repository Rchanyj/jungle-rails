class SessionsController < ApplicationController

  def new
    session[:prev] ||= request.referrer
    session[:rawprev] = request.referrer
    if session[:prev] != session[:rawprev] && session[:rawprev] != "http://localhost:3000/login"
      session[:realprev] = session[:rawprev]
    end
  end

  def create
    user = User.find_by_email(params[:email])

    if user && user.authenticate(params[:password])
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
