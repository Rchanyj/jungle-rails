class UsersController < ApplicationController

  def new
    session[:prev] ||= request.referrer
    puts "prev url: ", request.referrer
  end

  def create
    user = User.new(user_params)

    if user.save
      session[:user_id] = user.id
      redirect_to session.delete(:prev)
    else
      redirect_to '/signup'
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






























