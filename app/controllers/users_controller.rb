class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: :show
  skip_before_action :ensure_signup_complete, only: :show

  def update
    # authorize! :update, @user
    respond_to do |format|
      if @user.update(user_params)
        sign_in(@user == current_user ? @user : current_user, bypass: true)
        format.html { redirect_to @user, notice: 'Your profile was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def finish_signup
    redirect_to profile_path(username: current_user.username) if current_user.email_verified?
    # authorize! :update, @user
    if request.patch? && params[:user] #&& params[:user][:email]
      if current_user.update_without_password(user_params)
        # current_user.skip_reconfirmation!
        sign_in(current_user, bypass: true)
        redirect_to profile_path(username: current_user.username), notice: 'Your profile was successfully updated.'
      else
        @show_errors = true
      end
    end
  end

  def destroy
    # authorize! :delete, @user
    @user.destroy
    respond_to do |format|
      format.html { redirect_to root_url }
      format.json { head :no_content }
    end
  end

  private

  def user_params
    accessible = [:name, :email] # extend with your own params
    accessible << [:password, :password_confirmation] unless params[:user][:password].blank?
    params.require(:user).permit(accessible)
  end
end
