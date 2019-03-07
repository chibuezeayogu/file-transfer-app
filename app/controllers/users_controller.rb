# frozen_string_literal: true

class UsersController < ApplicationController
  skip_before_action :require_valid_user!

  def register_form; end

  def login_form; end

  def create
    user = User.new(user_params)

    if user.save
      session[:user_id] = user.id
      redirect_to root_path
    else
      redirect_to register_path, danger: user.errors.full_messages
    end
  end

  def sign_in; end

  private

  def user_params
    params.permit(:email, :password, :password_confirmation)
  end
end
