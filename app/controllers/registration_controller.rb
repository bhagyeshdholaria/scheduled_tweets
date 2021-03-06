class RegistrationController < ApplicationController
  def new
    @user = User.new
  end

  def create
    # render plain: 'Account created successfully!'
    # render plain: params[:user]
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path, notice: 'Sign Up Successful.'
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
