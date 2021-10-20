class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = user_params
    user[:email] = user[:email].downcase
    new_user = User.create(user)
    if new_user.save
      session[:user_id] = new_user.id
      flash[:success] = "Welcome, #{new_user.email}!"
      redirect_to dashboard_path
    else
      redirect_to registration_path
      flash[:error] = "Error: #{error_message(new_user.errors)}"
    end
  end

  def show; end

  def find
    @found_user = User.find_by(email: params[:user_search].downcase)
    if !@found_user.nil? && @found_user.email == current_user.email
      flash[:alert] = 'You cannot follow yourself!'
    elsif !@found_user.nil? && current_user.friends_with?(@found_user.id)
      flash[:alert] = "You already follow #{@found_user.email}!"
    elsif !@found_user.nil? && !current_user.friends_with?(@found_user.id)
      current_user.followers << @found_user
      flash[:alert] = "You are now following #{@found_user.email}!"
    else
      flash[:alert] = 'User not found. Please try your search again.'
    end
    redirect_to dashboard_path
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
