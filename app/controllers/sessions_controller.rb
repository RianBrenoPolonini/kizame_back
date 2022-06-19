# frozen_string_literal: true

class SessionsController < ApplicationController
  def signup
    @user = User.new(user_params)

    if @user.save
      render(json: @user, status: :created, location: @user)
    else
      render(json: @user.errors, status: :unprocessable_entity)
    end
  end

  def login
    @user = User.find_by(email: user_params[:email])

    if @user&.authenticate(user_params[:password])

      token = encode_user_data({ user_id: @user.id })

      render(json: { token: token, user: UserSerializer.new(@user) })
    else
      render(json: { message: 'E-mail ou Senha invalidos' })
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password,
                                 :password_confirmation, :modality_id)
  end
end
