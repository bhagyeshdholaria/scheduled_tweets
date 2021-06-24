class PasswordResetsController < ApplicationController
  def new; end

  def create
    @user = User.find_by(email: params[:email])

    if @user.present?
      # send email
      PasswordMailer.with(user: @user).reset.deliver_now
    end

    redirect_to root_path, notice: 'Link has been sent to reset your password.'
  end

  def edit
    @user = User.find_signed!(params[:token], purpose: 'password reset')
  rescue ActiveSupport::MessageVerifier::InvalidSignature
    redirect_to password_reset_path, alert: 'Your token has expired. Please try again.'
  end

  def update
    @user = User.find_signed!(params[:token], purpose: 'password reset')
    if @user.update(password_params)
      redirect_to sign_in_path, notice: 'Password reset successfully.'
    else
      render :edit
    end
  end

  private

  def password_params
    params.require(:user).permit(:password, :password_confirmation)
  end
end
