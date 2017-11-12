class SessionsController < ApplicationController

  def new
    session[:prev] ||= request.referrer
  end

  def create
    user = User.find_by_email(params[:email])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to session.delete(:prev)
    else
      redirect_to '/login'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to (:back)
  end

end
