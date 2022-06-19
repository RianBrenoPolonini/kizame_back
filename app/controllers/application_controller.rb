# frozen_string_literal: true

class ApplicationController < ActionController::API
  SECRET = ENV.fetch('SECRET_KEY_JWT')

  def authentication
    header = request.headers['token']
    header = header.split.last if header
    begin
      @decoded = JWT.decode(header, SECRET, true, { algorithm: 'HS256' })
      @current_user = User.find(@decoded[0]['user_id'])
    rescue ActiveRecord::RecordNotFound => e
      render(json: { errors: e.message }, status: :unauthorized)
    rescue JWT::DecodeError
      render(json: { error: 'Token invalido' }, status: :unauthorized)
    end
  end

  def encode_user_data(payload, exp = 20.minutes.from_now)
    payload[:exp] = exp.to_i
    JWT.encode(payload, SECRET, 'HS256')
  end
end
