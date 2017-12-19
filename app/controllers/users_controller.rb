class UsersController < ApplicationController

  def new
    session[:prev] ||= request.referrer
    session[:rawprev] = request.referrer
    if session[:prev] != session[:rawprev] && session[:rawprev] != "http://localhost:3000/signup"
      session[:realprev] = session[:rawprev]
    end
  end

  def create
    user = User.new(user_params)

    if user.save
      session[:user_id] = user.id
      redirect_to session.delete(:realprev)
    else
      flash[:notice] = user.errors.full_messages
      redirect_to signup_url
    end
  end

  private

  def user_params
    params.require(:user).permit(
      :firstname,
      :lastname,
      :email,
      :password,
      :password_confirmation
      )
  end

end
